#! /usr/bin/env ruby

MIN_IN_DAY = 1440

class Integer
  def to_s
    total_min = self % MIN_IN_DAY
    hour, minute = total_min.divmod(60)
    
    format('%02d', hour) + ':' + format('%02d', minute)
  end
end

module Clock
  def self.at(hours, minutes = 0)
    (hours * 60 + minutes) % MIN_IN_DAY
  end
end
