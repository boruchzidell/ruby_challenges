#! /usr/bin/env ruby

class Series
  def initialize(string)
    @digits = string.each_char.map(&:to_i)
  end

  def slices(int)
    raise ArgumentError if int > @digits.size

    @digits.each_cons(int).to_a
  end
end
