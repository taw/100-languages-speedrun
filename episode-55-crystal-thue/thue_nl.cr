class ThueRule
  @left : String
  @right : String
  getter :left

  def initialize(left, right)
    @left = process_backslashes(left)
    @right = process_backslashes(right)
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

  def process_backslashes(s)
    s.gsub(/\\./) do |m|
      case m[1]
      when 'n'
        '\n'
      when 's'
        ' '
      else
        m[1]
      end
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
      next unless line =~ /\A(.*)::=(.*)\z/
      break if $1 == ""
      @rules << ThueRule.new($1, $2)
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

  def run
    @state = @initial
    if ENV["DEBUG"]?
      @rules.each do |rule|
        STDERR.puts rule
      end
    end

    while match = random_match
      rule = match[:rule]
      idx = match[:idx]
      if ENV["DEBUG"]?
        STDERR.puts "Applying rule #{rule} at #{idx} to #{@state.inspect}"
      end
      @state = rule.apply(@state, idx)
    end

    if ENV["DEBUG"]?
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
  prog.run
rescue e : IO::Error
  exit if e.os_error == Errno::EPIPE
  raise e
end
