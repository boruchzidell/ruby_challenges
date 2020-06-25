#! /usr/bin/env ruby

class Prime
  def self.nth(limit)
    raise ArgumentError if limit == 0
    return 2 if limit == 1

    counter = 1
    prime_candidate = 1

    while counter < limit
      prime_candidate += 2
      counter +=1 if prime?(prime_candidate)
    end

    prime_candidate
  end

  def self.prime?(int)
    (2..int/2).each do |factor|
      return false if int % factor == 0
    end

    true
  end
end
