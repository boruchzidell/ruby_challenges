#! /usr/bin/env ruby

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(ary)
    ary.select do |e|
      @word.chars.sort == e.downcase.chars.sort && @word != e.downcase
    end
  end
end