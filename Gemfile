source "https://rubygems.org"

gem "rake", "~> 10.0"

group :development do
  gem "guard"
  gem "guard-rspec", require: false
  gem "flavor_gem"
  gem "wdm", ">= 0.1.0" if Gem.win_platform?
end

group :test do
  gem "rspec"
end

# Specify your gem's dependencies in pj.gemspec
gemspec
