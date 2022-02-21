class TuplesParser
  def initialize(path)
    @path = Pathname(path)
  end

  def parse_error(fragment)
    raise "Parse error in #{@path}:#{@lineno}: #{fragment}"
  end

  def parse_left_part(fragment)
    fragment.split(/\s*,\s*/).map do |frag|
      case frag
      when /\A\d+\z/
        frag.to_i
      when "_"
        nil
      else
        frag.to_sym
      end
    end
  end

  def parse_left(text)
    return [] if text.empty?
    parse_error text unless text =~ /\A\((.*)\)\z/
    parts = $1.split(/\)\s*,\s*\(/)
    parts.map { |part| parse_left_part(part) }
  end

  def parse_right(text)
    parse_error text unless text =~ /\A\((.*)\)\z/
    eval "proc{ [#{$1}] }", nil, @path.to_s, @lineno
  end

  def call
    rules0 = []
    rules1 = []
    rules2 = []
    @lineno = 0
    @path.each_line do |line|
      @lineno += 1
      next if line =~ /\A\s*#/
      next unless line =~ /(.*)->(.*)/
      right = parse_right($2.strip)
      left = parse_left($1.strip)
      case left.size
      when 0
        rules0 << right
      when 1
        rules1 << [left[0], right]
      when 2
        rules2 << [left[0], left[1], right]
      else
        parse_error "Only rules with 0-2 dependencies allowed: #{text}"
      end
    end
    TuplesProgram.new(rules0, rules1, rules2)
  end
end
