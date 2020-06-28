#! /usr/bin/env ruby

class BeerSong
  def verse(int)
    starting_bottle = case int
                      when 0
                        'No more bottles'
                      when 1
                        '1 bottle'
                      else # 2
                        "#{int} bottles"
    end

    take_bottle = case int
                  when 0
                    'Go to the store and buy some more'
                  when 1
                    'Take it down and pass it around'
                  else
                    'Take one down and pass it around'
    end

    ending_bottle = case int
                    when 0
                      '99 bottles'
                    when 1
                      'no more bottles'
                    when 2
                      "#{int - 1} bottle"
                    else
                      "#{int - 1} bottles"
      end

    "#{starting_bottle} of beer on the wall, #{starting_bottle.downcase} of beer.\n" \
    "#{take_bottle}, #{ending_bottle} of beer on the wall.\n"
  end

  def verses(start_bottle, end_bottle)
    verses = []
    start_bottle.downto(end_bottle).each do |num|
      verses << verse(num)
    end

    verses.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
