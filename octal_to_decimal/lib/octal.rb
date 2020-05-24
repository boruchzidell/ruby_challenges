#! /usr/bin/env ruby

class Octal
  def initialize(string)
    @string = string.reverse
  end

  # Any letter or digit > 7 is invalid
  def invalid_input?
    @string.each_char.any? { |d| (d =~ /\D/) || (d.to_i > 7) }
  end

  def to_decimal
    return 0 if invalid_input?

    digits = @string.each_char.map(&:to_i)
    sum = 0

    digits.each_with_index do |digit, idx|
      sum += digit * (8**idx)
    end

    sum
  end
end
