#! /usr/bin/env ruby

class Robot
  @@names = []

  def initialize
    @name = generate_name
  end

  def name
    @name || generate_name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  def ==(other)
    name == other.name
  end

  private

  def generate_name
    loop do
      @name = "#{[*'A'..'Z'].sample(2).join}#{rand(1000)}"
      break unless @@names.include?(@name)
    end
    @@names << @name

    @name
  end
end