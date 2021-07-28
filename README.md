# Jekyll Glossary Tooltip Tag Plugin
[![Gem Version](https://badge.fury.io/rb/jekyll-glossary_tooltip.svg)](https://badge.fury.io/rb/jekyll-glossary_tooltip)
[![Gem Downloads](https://ruby-gem-downloads-badge.herokuapp.com/jekyll-glossary_tooltip?color=brightgreen&type=total&label=gem%20downloads)](https://rubygems.org/gems/jekyll-glossary_tooltip)
[![Travis Build Status](https://img.shields.io/travis/erikw/jekyll-glossary_tooltip/main?logo=travis)](https://travis-ci.com/erikw/jekyll-glossary_tooltip)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/59050f3f66ed1f1ee32e/maintainability)](https://codeclimate.com/github/erikw/jekyll-glossary_tooltip/maintainability)
[![Code Climate Test Coverage](https://api.codeclimate.com/v1/badges/59050f3f66ed1f1ee32e/test_coverage)](https://codeclimate.com/github/erikw/jekyll-glossary_tooltip/test_coverage)

TODO make all badges work

This plugin simplifies for your readers and you by making it easy to define terms or abbrevivations that needs an explanation. Define a common dictionary of terms and their definition in a yaml file. Then inside markdown files you can use the provided glossary liquid tag to insert a tooltip for a defined word from the dictionary. The tooltip will show the term definiton on mouse hover.


# Installation
1. Add this gem to your Jekyll site's Gemfile
   - Simply with `$ bundle add jekyll-glossary_tooltip` when standing in the Jekyll project
   - Or manually by adding to `Gemfile`
   ```ruby
     gem 'jekyll-glossary_tooltip'
   ```
   and then running `$ bundle install`.
1. In your site's `_config.yml`, enable the plugin:
   ```yml
   plugins:
     - jekyll-glossary_tooltip
   ```
1. TODO explain data/glossary.yml
1. Now just build your site and verify that the verification file now exist!
   ```console
   $ bundle exec jekyll build
   ```

# Development
The structure of this plugin was inspired by [https://ayastreb.me/writing-a-jekyll-plugin/](https://ayastreb.me/writing-a-jekyll-plugin/), the plugin jekyll-sitemap and the [Bundler Gem tutorial](https://bundler.io/guides/creating_gem.html).

After checking out the repo;
1. Install [RVM](https://rvm.io/rvm/install) and install a supported ruby version (see .gemspec)
1. run `script/setup` to install dependencies
1. run `script/test` to run the tests
1.  You can also run `script/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Local development
Following the setup at [how-to-specify-local-ruby-gems-in-your-gemfile](https://rossta.net/blog/how-to-specify-local-ruby-gems-in-your-gemfile.html), these are the steps needed to build a jekyll site with a local clone of this plugin for local testing.

1. Clone this repo to your machine, say at `~/src/jekyll-glossary_tooltip`
1. In your Jekyll project's `Gemfile`:
   - Remove the `gem 'jekyll-glossary_tooltip'` part
   - Add instead `gem 'jekyll-glossary_tooltip', github: 'erikw/jekyll-glossary_tooltip', branch: 'main'`
1. Configure bundler to use a local path for this gem in this project:
   - `$ bundle config --local local.jekyll-glossary_tooltip ~/src/jekyll-glossary_tooltip`
1. Update the project: `$ bundle install`
1. Now the project will build with the local clone of this plugin when issuing e.g. `bundle exec jekyll build`
1. When you're done:
  - Remove the local override with: `$ bundle config --delete local.jekyll-glossary_tooltip`
  - Optionally restore the original gem include in `Gemfile` or keep building from a branch in the github repo.

## Releasing
Instructions for relasing on rubygems.org below. Optionally make a GitHub [release](https://github.com/erikw/jekyll-glossary_tooltip/releases) after this for the pushed git tag.

## Using bundler/gem_tasks rake tasks
Following instructions from [bundler.io](https://bundler.io/guides/creating_gem.html#releasing-the-gem):
```console
$ vi -p lib/jekyll-glossary_tooltip/version.rb CHANGELOG.md
$ bundle exec rake build
$ ver=$(ruby -r jekyll-glossary_tooltip/version -e 'puts Jekyll::GlossaryTooltip::VERSION')

# Optional: test locally by including in another project
$ gem install pkg/jekyll-glossary_tooltip-$ver.gem

$ bundle exec rake release
```

## Using gem-release gem extension
Using [gem-release](https://github.com/svenfuchs/gem-release):
```console
$ vi CHANGELOG.md && git add CHANGELOG.md && git commit -m "Update CHANGELOG.md" && git push
$ gem bump --version minor --tag --sign --push --release
```
For `--version`, use `major|minor|patch` as needed.

## Multi-versions
* For ruby, just use RVM to switch between supported ruby version specified in `.gemspec`.
* To run with different jekyll versions, [Appraisal](https://github.com/thoughtbot/appraisal) is used with [`Appraisals`](Appraisals) to generate different [`gemfiles/`](gemfiles/)
   - To use a specific Gemfile, run like
      ```console
      $ BUNDLE_GEMFILE=gemfiles/jekyll_4.x.x.gemfile bundle exec rake spec
      $ bundle exec appraisal jekyll-4.x.x rake spec
      ```
   - To run `rake spec` for all gemfiles:
      ```console
      $ bundle exec appraisal rake spec
      ```
   - To generate new/updated gemfiles from `Appraisals`
      ```console
      $ bundle exec appraisal install
      $ bundle exec appraisal generate --travis
      ```

## Travis
To use the [travis cli client](https://github.com/travis-ci/travis.rb) (installed from `Gemfile`):
1. Get a GitHub OAuth token by
   - going to [github.com/settings/tokens](https://github.com/settings/tokens)
   - create a new token named `travis-cli`
   - Set the scopes `repo`, `read:org`, `user:email` according to the [docs](https://docs.travis-ci.com/user/github-oauth-scopes).
1. Set travis.com as the default so we don't need to add `--pro` to most commands
   ```console
   $ bundle exec travis endpoint --set-default --api-endpoint https://api.travis-ci.com/
   ```
1. Login with the cli client
   ```console
   $ bundle exec travis login --github-token $GITHUB_TOKEN
   ```
1. Now the cli client can be used (might need `--pro` to use travis.com)
   ```console
   $ bundle exec travis lint
   $ bundle exec travis accounts
   $ bundle exec travis status
   $ bundle exec travis branches
   $ bundle exec travis monitor
   ```

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/erikw/jekyll-glossary_tooltip.

# License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
