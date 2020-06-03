#! /usr/bin/env ruby
# frozen_string_literal: true

VALUES = {
  %w[A E I O U L N R S T] => 1,
  %w[D G]                 => 2,
  %w[B C M P]             => 3,
  %w[F H V W Y]           => 4,
  %w[K]                   => 5,
  %w[J X]                 => 8,
  %w[Q Z]                 => 10
}.freeze

class Scrabble
  def initialize(str)
    @string = str
  end

  def self.score(str)
    scrabble = new(str)
    scrabble.score
  end

  def score
    return 0 if @string =~ /[^a-z]/i || @string.nil?

    score = 0
    @string.upcase.each_char do |letter|
      VALUES.each do |k, v|
        score += v if k.include?(letter)
      end
    end

    score
  end
end
