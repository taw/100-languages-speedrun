#!/usr/bin/env ruby

trap("PIPE", "EXIT")

(1..1_000_000).each{|n| puts n}
