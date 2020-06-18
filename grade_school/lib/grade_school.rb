#! /usr/bin/env ruby

class School
  attr_accessor :school

  def initialize
    @school = Hash.new { |h, k| h[k] = [] }
  end

  def to_h
    school
      .transform_values(&:sort)
      .sort
      .to_h
  end

  def add(name, grade)
    school[grade] << name
  end

  def grade(grade)
    school[grade].sort
  end
end
