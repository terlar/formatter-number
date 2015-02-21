# formatter-number

Format numbers

[![Gem Version](https://badge.fury.io/rb/formatter-number.svg)](http://badge.fury.io/rb/formatter-number)
[![Build
Status](https://travis-ci.org/terlar/formatter-number.svg)](https://travis-ci.org/terlar/formatter-number)
[![Code Climate](https://codeclimate.com/github/terlar/formatter-number.png)](https://codeclimate.com/github/terlar/formatter-number)

## Installation

Add this line to your application's Gemfile:

    gem 'formatter-number'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formatter-number

## Usage

```ruby
formatter = Formatter::Number.new
formatter.format(10.556)  # "10.56"
formatter.format(505_000) # "505,000"

formatter = Formatter::Number.new(grouping: 2)
formatter.format(10_000)  # "10,000"
formatter.format(505_000) # "5,05,000"

formatter = Formatter::Number.new(grouping: 4)
formatter.format(100_004)    # "10,0004"
formatter.format(10_050_026) # "1005,0026"

formatter = Formatter::Number.new(delimiter: ' ')
formatter.format(10_000)  # "10 000"
```

## Contributing

1. Fork it ( https://github.com/terlar/formatter-number/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
