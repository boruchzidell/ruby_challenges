#! /usr/bin/env ruby

module RunLengthEncoding

  def self.encode(str)
    str
      .chars
      .chunk_while {|a,b| a == b }
      .map { |chunk| "#{ chunk.size if chunk.size > 1 }#{ chunk.first }" }
      .join
  end

  def self.decode(compacted)
    compacted
      .scan(/(\d*)([ \D])/)
      .map { |(num, letter)| num = '1' if num == ''; letter * num.to_i }
      .join
  end
end
