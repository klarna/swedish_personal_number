[![Code Climate](https://codeclimate.com/github/klarna/swedish_personal_number/badges/gpa.svg)](https://codeclimate.com/github/klarna/swedish_personal_number)

# SwedishPersonalNumber

A Value Object with convenience helpers for [Swedish personal numbers](http://en.wikipedia.org/wiki/Personal_identity_number_(Sweden)) (personnummer).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swedish_personal_number', github: 'klarna/swedish_personal_number'
```

And then execute:

    $ bundle


## Usage

```ruby
pno = SwedishPersonalNumber.new("660101-0034")
pno.valid?
pno.birth_date # returns Date instance
pno.of_underage_person?
```
## Roadmap

  - Make it behave like a real Value Object (i.e. to be intercheangeable for a String)
  - Add checksum validation ([something like that](https://github.com/rolfb/luhn-ruby/blob/master/lib/luhn.rb))
  - Evaluate if we should use a proper parser for this (like in the alternative_implementation).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/swedish_personal_number/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
