class TuplesProgram
  def initialize(rules0, rules1, rules2)
    @rules0 = rules0
    @rules1 = rules1
    @rules2 = rules2
  end

  def debug
    STDERR.puts yield if ENV["DEBUG"]
  end

  def add(state)
    return if @states.include?(state)
    return if state.any?(&:negative?)
    debug{ "Adding #{state.inspect}" }
    @states << state
    @queue << state
  end

  def process(state)
    @rules1.each do |pattern, block|
      process_rule state, pattern, block
    end
  end

  def process_rule(state, pattern, block)
    return unless pattern.size == state.size
    args = OpenStruct.new
    pattern.size.times do |i|
      # _ => nil => ignore
      next unless pattern[i]
      # symbol => pass to block
      if pattern[i].is_a?(Symbol)
        args[pattern[i]] = state[i]
      # number => check for equality
      elsif pattern[i] != state[i]
        return
      end
    end
    add args.instance_eval(&block)
  end

  # This is very slow
  def process_rule2s
    @rules2.each do |pattern1, pattern2, block|
      part1s = []
      part2s = []
      @states.each do |state|
        next unless state.size == pattern1.size
        h = process_partial_rule(pattern1, state)
        part1s << h if h
      end
      @states.each do |state|
        next unless state.size == pattern2.size
        h = process_partial_rule(pattern2, state)
        part2s << h if h
      end
      debug{ "Rule2: #{part1s.inspect} v #{part2s.inspect}" }
      part1s.each do |part1|
        part2s.each do |part2|
          arg = OpenStruct.new(part1.merge(part2))
          add arg.instance_eval(&block)
        end
      end
    end
  end

  def process_partial_rule(pattern, state)
    args = {}
    pattern.zip(state).each do |patterni, statei|
      next unless patterni
      if patterni.is_a?(Symbol)
        args[patterni] = statei
      elsif patterni != statei
        return
      end
    end
    args
  end

  def load_file(data, file_index)
    data.each_with_index do |c, i|
      add [0, 2, file_index, i, c]
    end
    add [0, 2, file_index, data.size, 0]
  end

  def reset
    @queue = []
    @states = Set[]
    @requests_done = Set[]
    @input_done = -1
    @output_done = -1
    @input = []
    @no_more_input = false
    @rules0.each do |block|
      add block.call
    end
  end

  def process_requests
    active = false
    input_request = @input_done
    output_request = @output_done
    @states.select{|s| s[0] == 0}.each do |state|
      next if @requests_done.include?(state)
      if state.size == 3 and state[1] == 0
        input_request = [state[2], input_request].max
      elsif state.size == 3 and state[1] == 3
        output_request = [state[2], output_request].max
        add [0, 3, state[2], 0]
      elsif state.size == 5 and state[1] == 4
        # Can just process this right away
        add [*state, rand(state[3]..state[4])]
      else
        next
      end
      active = true
      @requests_done << state
    end
    process_output output_request if output_request != @output_done
    process_input input_request if input_request != @input_done
    active
  end

  def process_input(input_request)
    debug{ "Processing input request up to #{input_request}" }
    while input_request >= @input.size or @no_more_input
      line = STDIN.gets
      if line
        debug{ "Adding #{line.codepoints}" }
        @input.push *line.codepoints
      else
        debug{ "Adding 0 for EOF" }
        @no_more_input = true
        @input.push 0
        break
      end
    end
    @input.each_with_index do |c, i|
      add [0, 0, i, c]
    end
    @input_done = input_request
  end

  def process_output(output_request)
    output_todo = @states.filter{|s|
      s.size == 4 and s[0] == 0 and s[1] == 1 and s[2] > @output_done and s[3] != 0
    }
    if output_request
      output = output_todo.filter{|s| s[2] <= output_request}.sort.map(&:last)
      debug{ "Processing output request #{@output_done+1} to #{output_request}: #{output.inspect}" }
      @output_done = output_request
    else
      output = output_todo.sort.map(&:last)
    end
    print output.pack("U*")
  end

  def call
    loop do
      until @queue.empty?
        process @queue.pop until @queue.empty?
        process_rule2s
      end
      break unless process_requests
    end

    process_output(nil)

    if ENV["DEBUG"]
      @states.sort.each do |state|
        p state
      end
    end
  end
end
