#! /usr/bin/env ruby

class Trinary
  def initialize(string)
    @string = string.reverse
  end

  # Any letter or digit > 7 is invalid
  def invalid_input?
    @string.each_char.any? { |d| d =~ /[^0-2]/ }
  end

  def to_decimal
    return 0 if invalid_input?

    digits = @string.each_char.map(&:to_i)
    sum = 0

    digits.each_with_index do |digit, idx|
      sum += digit * (3**idx)
    end

    sum
  end
end