#! /usr/bin/env ruby

require 'minitest/reporters'
Minitest::Reporters.use!

require 'minitest/autorun'

require_relative '../lib/palindrome'

class TestPalindrome < Minitest::Test
  def test_simple_word
    assert_equal true, Palindrome.new('rotor').palindrome?
  end

  def test_ignore_nonletters
    assert_equal true, Palindrome.new('no1,3on').palindrome?
  end

  def test_case_insensitive
    assert_equal true, Palindrome.new('Rotor').palindrome?
  end

  def test_even_number_of_letters
    assert_equal true, Palindrome.new('abbccbba').palindrome?
  end

  def test_empty_string
    assert_equal true, Palindrome.new('').palindrome?
  end

  def test_single_letter
    assert_equal true, Palindrome.new('a').palindrome?
  end

  def test_string_with_space
    assert_equal true, Palindrome.new('abb a').palindrome?
  end
end
