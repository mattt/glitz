module Glitz
  COLORS = {
    :black      => 0,
    :red        => 1,
    :green      => 2,
    :yellow     => 3,
    :blue       => 4,
    :magenta    => 5,
    :cyan       => 6,
    :white      => 7
  }

  EFFECTS = {
    :bold       => 1,
    :underline  => 4,
    :blink      => 5,
    :reverse    => 7,
    :concealed  => 8,
  }

  def self.included(klass)
    String.instance_eval do
      extend ClassMethods
      include InstanceMethods
    end
  end

  module ClassMethods
    def ansi_colors
      COLORS.keys
    end

    def ansi_effects
      EFFECTS.keys
    end
  end

  module InstanceMethods
    def colorize(options = {})
      ColoredString.new(self).colorize(options)
    end

    def uncolorize
      self
    end

    EFFECTS.keys.each do |effect|
      define_method(effect) do
        colorize(:effects => effect)
      end
    end

    def foreground(color)
      colorize(:foreground => color)
    end

    def background(color)
      colorize(:background => color)
    end
  end

  private

  class ColoredString
    include InstanceMethods

    def initialize(string)
      @string = string
      @effects = []
    end

    def colorize(options = {})
      @foreground = COLORS[options.delete(:foreground)] + 30 if options.key? :foreground
      @background = COLORS[options.delete(:background)] + 40 if options.key? :background
      @effects += Array(options.delete(:effects)).collect{|s| EFFECTS[s]} if options.key? :effects

      self
    end

    def uncolorize
      @string
    end

    def to_s
      "\033[#{[@effects, @foreground, @background].flatten.compact.uniq.join(';')}m#{@string}\033[0m"
    end

    alias :to_str :to_s

    def method_missing(method_name, *args, &block)
      self.to_s.send(method_name, *args, &block)
    end
  end
end
