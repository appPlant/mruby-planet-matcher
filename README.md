# Planet matcher mgem for Orbit <br> [![Build Status](https://travis-ci.com/appPlant/mruby-planet-matcher.svg?branch=master)](https://travis-ci.com/appPlant/mruby-planet-matcher) [![Maintainability](https://api.codeclimate.com/v1/badges/0b865e700cc7ae2a5863/maintainability)](https://codeclimate.com/github/appPlant/mruby-planet-matcher/maintainability)

Select matching planets by a kind of flexible query syntax.

```ruby
PlanetMatcher.new('location:leipzig').match? 'location' => ['leipzig', 'halle']

# => true
```

Matches the planet with exact same id:

    id=mars

Matches the planet with exact same id but ignores case-sensitive:

    id:^(?i)mars$

Matches any productive planet in Germany:

    location:germany@env=prod

Matches any productive planet out of Germany:

    %location:germany@env=prod

## Installation

Add the line below to your `build_config.rb`:

```ruby
MRuby::Build.new do |conf|
  # ... (snip) ...
  conf.gem 'mruby-planet-matcher', github: 'appplant/mruby-planet-matcher'
end
```

Or add this line to your aplication's `mrbgem.rake`:

```ruby
MRuby::Gem::Specification.new('your-mrbgem') do |spec|
  # ... (snip) ...
  spec.add_dependency 'mruby-planet-matcher', github: 'appplant/mruby-planet-matcher'
end
```

## Development

Clone the repo:
    
    $ git clone https://github.com/appplant/mruby-planet-matcher.git && cd mruby-planet-matcher/

Compile the source:

    $ rake compile

Run the tests:

    $ rake test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/appplant/mruby-planet-matcher.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Authors

- Sebastián Katzer, Fa. appPlant GmbH

## License

The mgem is available as open source under the terms of the [MIT License][license].

Made with :heart: in Leipzig

© 2019 [appPlant GmbH][appplant]

[mruby]: https://github.com/mruby/mruby
[license]: http://opensource.org/licenses/MIT
[appplant]: www.appplant.de
