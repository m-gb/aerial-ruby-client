# AerialRubyClient

This is a simple gem that downloads the Aerial Apple TV videos and saves them to a given directory.

These videos can then be used by Xscreensaver on GNU/Linux.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aerial_ruby_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aerial_ruby_client

## Usage

Within irb or in a ruby application, use this method with a target folder (in this example Aerial) as an argument:
```ruby
download_aerials('Aerial')
```
As a result, the gem will create a new folder in the home directory of the current user and download the videos into it.

Then, add this line to .xscreensaver below the other screensavers (most start with `- GL:`):
```
- Best: "Apple Aerial" mpv --really-quiet --shuffle --no-audio \
        --fs --loop=inf --no-stop-screensaver \
        --wid=$XSCREENSAVER_WINDOW --panscan=1 \
        $HOME/Aerial/* \n\
```

Note: this gem can be reused periodically to fetch the latest videos from Apple. 
If a video already exists in the target folder, it will be skipped.

Enjoy your new screensaver!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/m-gb/aerial_ruby_client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
