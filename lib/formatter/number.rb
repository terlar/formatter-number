# encoding: utf-8

module Formatter
  # Number formatter
  class Number
    DEFAULTS = {
      decimals: 2,
      fixed: false,
      separator: '.',
      grouping: 3,
      delimiter: ','
    }.freeze

    # Initialize a formatter with the desired options.
    #
    # @param [Hash] options the options to create a formatter with
    # @option options [Integer] :decimals (2) Number of decimal places
    # @option options [Boolean] :fixed (false) Fixed decimal places
    # @option options [String] :separator ('.') Decimal mark
    # @option options [Integer] :grouping (3) Number of digits per group
    # @option options [String] :delimiter (',') Delimiter between groups
    def initialize(options = { }.freeze)
      @options = defaults.merge(options)
    end

    def format(number)
      case number
      when Float then format_float(number)
      when Integer then format_integer(number)
      else fail ArgumentError
      end
    end

    private

    def format_float(number)
      if fixed?
        number = "%0.0#{decimals}f" % number
      else
        number = number.round(decimals)
      end

      number = number.to_s.gsub('.', separator)

      delimit(number)
    end

    def format_integer(number)
      delimit(number)
    end

    def delimit(number)
      if grouping == 2
        # When grouped by two the first group is by three and the rest of them
        # are grouped by two. This is according to the Indian Numbering System.
        number.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1#{delimiter}")
      else
        group = '\d' * grouping
        number.to_s.gsub(/(\d)(?=(#{group})+(?!\d))/, "\\1#{delimiter}")
      end
    end

    def defaults
      DEFAULTS
    end

    def decimals
      @options.fetch :decimals
    end

    def fixed?
      @options.fetch :fixed
    end

    def separator
      @options.fetch :separator
    end

    def grouping
      @options.fetch :grouping
    end

    def delimiter
      @options.fetch :delimiter
    end
  end
end
