#! /usr/bin/env ruby

class Triangle
  def initialize(row_limit)
    @row_limit = row_limit
  end

  def rows
    rows = [[1]]
  
    (@row_limit - 1).times do
      row = rows.last.each_cons(2).map { |(a, b)| a + b }
      row.unshift(1)
      row.append(1)
      rows << row
    end
  
  rows
  end
end
