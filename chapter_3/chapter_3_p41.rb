require_relative '../assert/assert.rb'
include Assert

############## Page 41 ##############
require_relative 'chapter_3_p36.rb'

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring:, cog:, wheel:)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end
# ...
end

# Gear expects a 'Duck' that knows 'diameter'

wheel = Wheel.new(26, 1.5)
gear = Gear.new(chainring: 52 , cog: 11, wheel: wheel)
assert(137.0909090909091, gear.gear_inches)
