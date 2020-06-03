#! /usr/bin/env ruby

class SecretHandshake
  def initialize(input)
    @input = input
  end

  def convert_to_binary
    @input = @input.to_s(2) if @input.is_a?(Integer)
  end

  def invalid_binary?
    @input =~ /[^01]/
  end

  def commands
    convert_to_binary

    return [] if invalid_binary?

    secrets = ['wink', 'double blink', 'close your eyes', 'jump']

    results = []

    @input.reverse!
    reverse_the_results = @input.slice!(4)

    @input.chars.each_with_index do |binary, idx|
      results << secrets[idx] if binary == '1'
    end

    reverse_the_results ? results.reverse : results
  end
end
