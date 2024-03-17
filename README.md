# Coolab

A Cool open-source project collaboration for your teams !

It has three main project features: issues, chat and documents.

## Getting Started

### Requirements

You will need a few non-Ruby packages installed :

* Ruby 3.2.0 - `rbenv install 3.2.0`
* Rails 7.0.4.2 - `gem install rails -v 7.0.4.2`
* [libvips](https://github.com/libvips/libvips/wiki#building-and-installing) - `sudo apt install libvips`
* [postgresql](https://www.postgresql.org/download/linux/ubuntu/) - `sudo apt install postgresql` 

### Initial setup

To quick start, just clone the repo:

```bash
git clone https://github.com/m1ranto/coolab.git
```

Then install gem dependencies in `Gemfile` using:

```bash
bundle install
```

Then run database migration:

```bash
rails db:migrate
```

Finally, start the web server:

```bash
rails server
```

## Contributing

If you're interested in contributing, just submit a pull request.
