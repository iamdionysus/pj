# Pj

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pj'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pj

## Usage

### sync
Syncing a fork from upstream with [the following instruction](https://help.github.com/articles/syncing-a-fork/)

	$ pj project-name-in-config-file sync

### push
Runs git push origin master

	$ pj project-name push

### owner
Assuming you have upstream, pushes to both upstream and origin

	$ pj project owner

### cd
Copy to cliboard `cd project-directory-name` command.

	$ pj project cd

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pj/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
