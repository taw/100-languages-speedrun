#!/usr/bin/env crystal

class ThueRule
  getter :left

  def initialize(@left : String, @right : String)
    @right = "~\n" if @right == "~"
  end

  def apply(str, idx)
    before = str[0, idx]
    after = str[idx+@left.size .. -1]

    if @right[0] == '~'
      print @right[1..-1]
      replacement = ""
    elsif @right == ":::"
      replacement = STDIN.gets.not_nil!.chomp
    else
      replacement = @right
    end

    before + replacement + after
  end

  def to_s(io)
    io << "Rule<#{@left.inspect}::=#{@right.inspect}>"
  end
end

class ThueSideParser
  getter :results
  @toparse : Array(Char)

  def initialize(@str : String)
    @results = [""]
    @toparse = @str.chars
    parse
  end

  private def parse
    until @toparse.empty?
      case @toparse[0]
      when '['
        chars = parse_range
        if @results.size == 1
          @results = chars.map{|c| @results[0]+c}
        elsif @results.size == chars.size
          @results = @results.zip(chars).map{|s,c| s+c}
        else
          raise "Sizes of character classes mismatch in #{@str}"
        end
      else
        c = parse_character
        @results = @results.map{|s| s + c}
      end
    end
    @results
  end

  private def parse_character
    if @toparse[0] == '\\'
      @toparse.shift
      raise "Unmatched \\ in #{@str}" if eos?
      c = @toparse.shift
      case c
      when 'n'
        '\n'
      when 's'
        ' '
      else
        c
      end
    else
      @toparse.shift
    end
  end

  private def parse_range
    chars = [] of Char
    @toparse.shift
    loop do
      raise "Character range never closed in #{@str}" if eos?
      if @toparse[0] == ']'
        @toparse.shift
        return chars
      end
      c = parse_character
      raise "Character range never closed in #{@str}" if eos?
      if @toparse[0] == '-'
        @toparse.shift
        e = parse_character
        raise "Invalid character range in #{@str}" if e < c
        chars.concat(c..e)
      else
        chars << c
      end
    end
  end

  private def eos?
    @toparse.empty?
  end
end

class ThueRuleParser
  def initialize(@str : String)
    if @str =~ /\A(.*)::=(.*)\z/
      @valid = true
      @left = $1
      @right = $2
    else
      @left = ""
      @right = ""
      @valid = false
    end
  end

  def valid_rule?
    @valid
  end

  def empty_rule?
    @valid && @left.empty?
  end

  def call
    lefts = ThueSideParser.new(@left).results
    rights = ThueSideParser.new(@right).results

    # Support N-to-1 and 1-to-N rules
    lefts *= rights.size if lefts.size == 1
    rights *= lefts.size if rights.size == 1

    unless lefts.size == rights.size
      raise "Mismatched side of rule #{@str}"
    end

    lefts.zip(rights).map do |left, right|
      ThueRule.new(left, right)
    end
  end
end

class ThueProgram
  def initialize
    @rules = [] of ThueRule
    @initial = ""
    @state = ""
  end

  def load(path)
    lines = File.read_lines(path).map(&.chomp).zip(1..)

    while lines.size > 0
      line, line_no = lines.shift
      # Ignoring invalid rules, they are sometimes used as comments
      parser = ThueRuleParser.new(line)
      next unless parser.valid_rule?
      break if parser.empty_rule?
      @rules.concat parser.call
    end

    @initial = lines.map(&.first).join("\n")
  end

  def random_match
    match = nil
    matches_count = 0
    @rules.each do |rule|
      idx = 0
      loop do
        match_idx = @state.index(rule.left, idx)
        break unless match_idx
        idx = match_idx + 1
        matches_count += 1
        next unless rand(matches_count) == 0
        match = {rule: rule, idx: match_idx}
      end
    end
    match
  end

  def run(debug)
    @state = @initial
    if debug
      @rules.each do |rule|
        STDERR.puts rule
      end
    end

    while match = random_match
      rule = match[:rule]
      idx = match[:idx]
      if debug
        STDERR.puts "Applying rule #{rule} at #{idx} to #{@state.inspect}"
      end
      @state = rule.apply(@state, idx)
    end

    if debug
      STDERR.puts "No more matches. Final state: #{@state.inspect}"
    end
  end
end

unless ARGV[0]
  STDERR.puts "Usage: #{$0} <file.thue>"
  exit 1
end

prog = ThueProgram.new
prog.load(ARGV[0])

# Crystal doesn't handle SIGPIPE well and we want to support:
# crystal thue.cr examples/fizzbuzz.thue | head -n 100
begin
  prog.run(!!ENV["DEBUG"]?)
rescue e : IO::Error
  exit if e.os_error == Errno::EPIPE
  raise e
end
