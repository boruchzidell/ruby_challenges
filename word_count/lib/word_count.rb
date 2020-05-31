#! /usr/bin/env ruby

class Phrase
  def initialize(string)
    @words = string.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    tally = Hash.new(0)
    @words.each do |word|
      tally[word] += 1 unless word.empty?
    end
    tally
  end

end