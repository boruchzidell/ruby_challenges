#! /usr/bin/env ruby

class PhoneNumber
  def initialize(str)
    @phone = str
  end

  def number
    cleaned_num = cleanup(@phone)

    return '0000000000' unless valid?(cleaned_num)
    return cleaned_num[-10..-1]
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

  private 

  def cleanup(num)
    num.gsub(/[() -\.]/, '')
  end

  def valid?(num)
    (num.size == 10 || (num.size == 11 && num.start_with?('1'))) && !(num =~ /[^\d]/)
  end

end
