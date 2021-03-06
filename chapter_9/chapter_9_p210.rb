
############## Page 210 ##############
# Create a player of the 'Diameterizable' role
class DiameterDouble
  def diameter
    10
  end
end

class GearTest < MiniTest::Unit::TestCase
  def test_calculates_gear_inches
    gear =  Gear.new(
              chainring: 52,
              cog:       11,
              wheel:     DiameterDouble.new)

    assert_in_delta(47.27,
                    gear.gear_inches,
                    0.01)
  end
end
