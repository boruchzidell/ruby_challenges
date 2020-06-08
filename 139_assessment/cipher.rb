#! /usr/bin/env ruby

class Cipher
  forward = [*'a'..'z']
  backward = ('z'.ord).downto('a'.ord).map(&:chr)
  SUBSTITUTIONS_HASH = forward.zip(backward).to_h

  def self.encode(text)
    plaintext = text.downcase
    plaintext.gsub!(/[^a-z\d]/, '')

    encoded_array = substitutions(plaintext)

    grouped_chars(encoded_array)
  end

  def self.substitutions(str)
    encoded = str.chars.map do |char|
      SUBSTITUTIONS_HASH.fetch(char, char)
    end
    encoded
  end

  def self.grouped_chars(ary)
    results = ''
    ary.each_slice(5) do |subarray|
      results << subarray.join
      results << ' '
    end

    results[0...-1]
  end
end
