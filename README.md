# Glitz
*ANSI-Colorized Glamour for Terminal Output*

Colors and effects can be chained and added in any order. You can specify one foreground color and one background color (setting a new value will overwrite the previous one). Effects like bold and underline combine together.

## Usage

```ruby
require 'glitz'
include Glitz

puts "Roses are Red".foreground(:red)
puts "Editors are White on Black".foreground(:white).background(:black)
puts "If you eat " + "Chunky Bacon".bold.underline
puts "Beware the dreaded " + "Blink Attack!".foreground(:white).background(:magenta).blink
```

### Supported Values

- Colors: `[:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white]`
- Effects: `[:bold, :underline, :blink, :reverse, :concealed]`

## Creator

Mattt Thompson ([@mattt](https://twitter.com/mattt))

## License

Glitz is available under the MIT license. See the LICENSE file for more info.
