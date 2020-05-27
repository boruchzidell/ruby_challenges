#! /usr/bin/env ruby

class SumOfMultiples

  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
    @limit = 0
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end

  def to(limit)
    @limit = limit
    accumulator = []
    @factors.each do |f|
      accumulator += f.step(@limit - 1, f).to_a
    end

    accumulator.uniq.sum
  end
end
