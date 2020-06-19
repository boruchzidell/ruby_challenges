#! /usr/bin/env ruby
require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    qualified_days = candidates(weekday)

    case schedule
    when :first
      qualified_days[0]
    when :second
      qualified_days[1]
    when :third
      qualified_days[2]
    when :fourth
      qualified_days[3]
    when :last
      qualified_days[-1]
    else
      qualified_days.detect { |date| teenth?(date.day) }
    end
  end

  private

  def candidates(weekday)
    date = Date.new(@year, @month)
    method = weekday.to_s + '?'

    weekdays = []
    while date.month == @month
      weekdays << date if date.send(method)
      date += 1
    end

    weekdays
  end

  def teenth?(int)
    (13..19).cover?(int)
  end
end
