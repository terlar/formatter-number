# encoding: utf-8

require_relative 'test_helper'

class IntegrationTest < Minitest::Test
  attr_reader :options

  def setup
    @options = { }
  end

  def format(number)
    Formatter::Number.new(options).format(number)
  end

  def test_fails_with_invalid_number
    assert_raises ArgumentError do
      format('invalid number')
    end
  end

  def test_decimals_defaults_to_two
    assert_equal '10.56', format(10.556)
  end

  def test_can_set_decimals
    @options[:decimals] = 3

    assert_equal '10.556', format(10.556)
  end

  def test_decimals_are_not_fixed_by_default
    assert_equal '10.5', format(10.5)
  end

  def test_can_set_fixed_to_make_decimals_fixed
    @options[:fixed] = true

    assert_equal '10.50', format(10.5)
  end

  def test_separator_defaults_to_dot
    assert_equal '10.53', format(10.53)
  end

  def test_can_set_separator_delimiter
    @options[:separator] = ','

    assert_equal '10,53', format(10.53)
  end

  def test_grouping_defaults_to_three
    assert_equal '100', format(100)
    assert_equal '10,000', format(10_000)
    assert_equal '505,000', format(505_000)
    assert_equal '121,212,123', format(121_212_123)
    assert_equal '7,000,000,000', format(7_000_000_000)
  end

  def test_can_set_the_grouping_with_2
    @options[:grouping] = 2

    assert_equal '100', format(100)
    assert_equal '10,000', format(10_000)
    assert_equal '5,05,000', format(505_000)
    assert_equal '12,12,12,123', format(121_212_123)
    assert_equal '7,00,00,00,000', format(7_000_000_000)
  end

  def test_can_set_the_grouping_with_4
    @options[:grouping] = 4
    assert_equal '10,0004', format(100_004)
    assert_equal '1005,0026', format(10_050_026)
    assert_equal '12,3456,7890,2345', format(12_345_678_902_345)
  end

  def test_delimiter_defaults_to_comma
    assert_equal '10,000', format(10_000)
  end

  def test_can_set_the_delimiter
    @options[:delimiter] = ' '

    assert_equal '10 000', format(10_000)
  end
end
