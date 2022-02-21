#!/usr/bin/env ruby

require "ostruct"
require "pathname"
require "pry"
require "set"
require_relative "tuples_parser"
require_relative "tuples_program"

class TuplesRunner
  def initialize(program_path, *file_paths)
    @program = TuplesParser.new(program_path).call
    @files = file_paths.map { |file_path| Pathname(file_path).read }
  end

  def call
    @program.reset
    @files.each_with_index do |file, i|
      @program.load_file file.codepoints, i
    end
    @program.call
  end
end

Signal.trap("PIPE", "EXIT")

unless ARGV.size >= 1
  STDERR.puts "Usage: #{$0} <input.txt> [<additional files> ...]"
  exit 1
end

TuplesRunner.new(*ARGV).call
