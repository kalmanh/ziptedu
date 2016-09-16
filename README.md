# Ziptedu

[![Build Status](https://travis-ci.org/kalmanh/ziptedu.png?branch=master)](https://travis-ci.org/kalmanh/ziptedu)

Collection of data and utilities to lookup postal-code based location information. This gem is **HEAVILY INSPIRED** by [Thomas Leen](http://www.thomasleen.com/)'s [zippity-do-dah](https://github.com/tleen/zippity-do-dah) (Node.js module that does pretty much the same thing).

Functions for looking up zipcode, city, state, latitude and longitude using a zipcode, city + state, or latitude + longitude. You can also get random sets of this data.

Data sourced from [federalgovernmentzipcodes.us](http://federalgovernmentzipcodes.us/). This is **primary** data, meaning data that maps to multiple locations will return only the primary location.

**NOTE:** The data is self-contained inside the gem, so no internet connection is required in order to use it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ziptedu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ziptedu

## Usage

```ruby
require('ziptedu')

puts Ziptedu.random(3)
puts Ziptedu.zipcode(21208).city
puts Ziptedu.random
puts Ziptedu.citystate("Baltimore", "MD")
puts Ziptedu.latlong('32.09', '-96.71')

```

# API

## Lookups

All lookups will return nil (if lookup was unsuccessful) or an instance of `Ziptedu::Zipcode` class with the following attributes:

* zipcode
* type (standard, military, po box)
* city
* state
* latitude
* longitude

These attributes may be empty if not applicable to the specific location returned.

### .zipcode(zipcode)
Lookup data by 5 digit zipcode (the argument can be either an integer or a string)

### .citystate(city, state)
Lookup data by city **and** state, capitalization does not matter.

### .latlong(latitude, longitude)
Lookup date by latitude and longitude, lat/long must have two decimal digits only _(-)xx.xx_.

## Utilities

### .random([number])
Will return a single random result, if number is specified and > 1 will return an array of random results.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kalmanh/ziptedu.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

