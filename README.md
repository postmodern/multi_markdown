# multi_markdown

* [Homepage](https://github.com/postmodern/multi_markdown#readme)
* [Issues](https://github.com/postmodern/multi_markdown/issues)
* [Documentation](http://rubydoc.info/gems/multi_markdown/frames)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

A common interface to multiple Ruby Markdown libraries.

## Supported

* [bluecloth](http://deveiate.org/projects/BlueCloth)
* [kramdown](http://kramdown.rubyforge.org/)
* [maruku](http://maruku.rubyforge.org/)
* [rdiscount](https://github.com/rtomayko/rdiscount#readme)
* [redcarpet](https://github.com/tanoku/redcarpet#readme)
* [rpeg_markdown](https://github.com/rtomayko/rpeg-markdown#readme)

## Examples

    require 'multi_markdown'

    MultiMarkdown.new('hello _world_').to_html
    # => "<p>hello <em>world</em></p>\n"

## Install

    $ gem install multi_markdown

## Copyright

Copyright (c) 2012-2013 Hal Brodigan

See {file:LICENSE.txt} for details.
