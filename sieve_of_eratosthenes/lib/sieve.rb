#! /usr/bin/env ruby

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    results = []
    array = [*2..@limit]

    current_prime = 0
    until array.empty?
      current_prime = array[0]
      array.reject! do |e|
        e % current_prime == 0
      end
      results << current_prime
    end
    results
  end
end
