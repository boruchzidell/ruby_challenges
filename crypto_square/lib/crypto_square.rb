#! /usr/bin/env ruby

class Crypto
  def initialize(string)
    @string = string.downcase
  end

  def normalize_plaintext
    @string.gsub(/[^a-z\d]/, '')
  end

  def size
    length = normalize_plaintext.size
    
    Math.sqrt(length).ceil
  end

  def plaintext_segments
    text = normalize_plaintext
    length = size()
    text.chars.each_slice(length).map {|*chars| chars.join}
  end

  def normalize_ciphertext
    padding = size - plaintext_segments.min_by(&:size).size

    plaintext_segments
      .map(&:chars)
      .each { |subarray| padding.times { subarray << '' } if subarray.size < size }
      .transpose
      .map(&:join)
      .join(' ')
  end

  def ciphertext
    normalize_ciphertext.gsub(' ', '')
  end
end
