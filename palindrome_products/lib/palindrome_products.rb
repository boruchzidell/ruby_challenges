#! /usr/bin/env ruby

class Palindromes
  def initialize(max_factor: 1, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    range = [*@min_factor..@max_factor]
    @palindromes = Hash.new {|h,k| h[k] = Struct.new(:value, :factors).new }

    permutations = range.repeated_combination(2).to_a
    
    permutations.each do |(first, second)|
      product = first * second
      pair = [first, second].sort

      if product.to_s == product.to_s.reverse
        palin_factor = @palindromes[product]
        palin_factor.value = product
        palin_factor.factors ? palin_factor.factors << pair : palin_factor.factors = [pair]
      end
    end
  end

  def largest
    @palindromes.max_by {|k,_| k }.last
  end

  def smallest
    @palindromes.min_by {|k,_| k }.last
  end
end
