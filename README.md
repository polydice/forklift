# Forklift

[![Build Status](https://travis-ci.org/polydice/forklift.png?branch=master)](https://travis-ci.org/polydice/forklift)
[![Code Climate](https://codeclimate.com/github/polydice/forklift.png)](https://codeclimate.com/github/polydice/forklift)
[![Coverage Status](https://coveralls.io/repos/polydice/forklift/badge.png?branch=master)](https://coveralls.io/r/polydice/forklift?branch=master)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'forklift'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install forklift

## Usage

### Get all sections / sites / categories / subcategories


```ruby
client = Forklift.new(api_key: 'xxxx', shared_secret: 'axxxx')
# Get all sections under the root.
sections = client.sections # => {"count" => 123, "category" => [{"no" => 1, "level_no" => 1, ...}, {...}, ...]}

# Get all sites under a specified section.
sites = client.sites(sections["category"].first)
# Or pass the parent no.
sites = client.sites(no: 123)

# Similarly to categories, subcategories ...
subcategories = client.subcategories(no: 345)
```

### Get all goods under certain category

```ruby
client = Forklift.new(api_key: 'xxxx', shared_secret: 'axxxx')
gds = client.gds({no: 26, level_no: 1})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
