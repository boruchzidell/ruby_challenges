#! /usr/bin/env ruby
# frozen_string_literal: true

class DNA
  def initialize(strand1)
    @strand1 = strand1.chars
  end

  def hamming_distance(strand2)
    @strand2 = strand2.chars

    diffs = 0
    counter = 0

    loop do
      s1 = @strand1[counter]
      s2 = @strand2[counter]
      break if s1.nil? || s2.nil?

      diffs += 1 if s1 != s2
      counter += 1
    end

    diffs
  end
end
