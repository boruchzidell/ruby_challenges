#! /usr/bin/env ruby

module Diamond
  def self.make_diamond(max_letter)
    widest_point = (max_letter.ord - ("A".ord - 1)) * 2 - 1

    return "A\n" if max_letter == 'A'

    letters = 'A'.upto(max_letter).to_a
    letters += letters[0..-2].reverse

    letters.map { |letter| format_line(letter, widest_point) }.join
  end

  def self.format_line(letter, line_width)
    return 'A'.center(line_width) + "\n" if letter == 'A'

    letter_position = (letter.ord - 'A'.ord)
    inner_spaces = 1.step(by: 2).take(letter_position).last
    (letter + ' ' * inner_spaces + letter).center(line_width) + "\n"
  end
end
