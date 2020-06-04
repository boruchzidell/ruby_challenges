#! /usr/bin/env ruby

class Luhn
  def initialize(input)
    @input = input
  end

  def addends
    @input.digits.map.with_index do |digit, idx|
      if idx.odd?
        digit * 2 > 9 ? (digit * 2) - 9 : digit * 2
      else
        digit
      end
    end
    .reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  # def self.create(input)
  #   luhn = new(input * 10)


  # end
end