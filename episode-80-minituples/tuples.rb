require "set"
require "pry"
require "ostruct"

class Tuples
  def initialize(&block)
    @states = Set[]
    @queue = []
    @rules = []
    instance_eval(&block)
  end

  def self.run(**kwargs, &block)
    new(&block).run(**kwargs)
  end

  def tuple(*state)
    return if @states.include?(state)
    return if state.any?(&:negative?)
    @states << state
    @queue << state
  end

  def process(state)
    @rules.each do |pattern, block|
      process_rule state, pattern, block
    end
  end

  def process_rule(state, pattern, block)
    return unless pattern.size == state.size
    args = OpenStruct.new
    pattern.size.times do |i|
      if pattern[i].is_a?(Symbol)
        args[pattern[i]] = state[i]
      elsif pattern[i] != state[i]
        return
      end
    end
    tuple *args.instance_eval(&block)
  end

  def rule(*pattern, &block)
    @rules << [pattern, block]
  end

  def read_input
    input = STDIN.read.codepoints.each
    input.each_with_index do |b, i|
      tuple 0, 0, i, b
    end
    tuple 0, 0, input.size, 0
  end

  def run(input: false)
    read_input if input

    until @queue.empty?
      process @queue.pop
    end

    output = @states.select{|s| s.size == 4 and s[0,2] == [0,1]}.sort.map(&:last)
    print output.pack("U*")

    if output.empty? or ENV["DEBUG"]
      @states.sort.each do |state|
        p state
      end
    end
  end
end
