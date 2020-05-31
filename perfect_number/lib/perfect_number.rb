#! /usr/bin/env ruby

class PerfectNumber
  def self.classify(int)
    raise RuntimeError if int < 0
    sum = sum_of_factors(int)
    return 'perfect' if sum == int
    return 'deficient' if sum < int
    return 'abundant'
  end
  
  def self.sum_of_factors(int)
    (1..int/2)
    .select { |e| int % e == 0 }
    .reduce(:+)
  end
 
end
