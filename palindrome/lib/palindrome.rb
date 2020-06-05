#! /usr/bin/env ruby

class Palindrome
  def initialize(str)
    @letters = str.downcase.chars.select do |letter|
      [*'a'..'z'].include? letter
    end
  end

  def palindrome?
    return true if @letters.size < 2

    until @letters.size < 2
      return false if @letters.shift != @letters.pop
    end

    true
  end
end
