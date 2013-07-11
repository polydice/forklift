# Forklift

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
sections = client.sections # => {:count=>"32", :catalogs=>[#<Forklift::Client::Catalog:0x007fd49a91c028 ....]}

# Pass a Forklift::Client::Catalog to get all sites under a specified section.
sites = client.sites(sections[:catalogs].first)
# Or pass the parent no.
sites = client.sites(no: 123)

# Similarly to categories, subcategories ...
subcategories = client.subcategories(no: 345)
subcategories = client.subcategories(category)

# You can going down from a specified no and level_no
client.going_down(no: 3, level_no: 1)
# moreover, going down from a specified catalog
section = sections[:catalogs].first
section.going_down
```

### Get all goods under certain category

```ruby
client = Forklift.new(api_key: 'xxxx', shared_secret: 'axxxx')
gds = client.unboxing({no: 26, level_no: 1})

# Or pass a Forklift::Client::Catalog 
gds = client.unboxing({no: 26, level_no: 1})

# unboxing from a specified catalog 
gds = section.unboxing
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
