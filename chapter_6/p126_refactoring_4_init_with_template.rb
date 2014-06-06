
############## Page 126 ##############
# Template method solution for initialize
# allows subclass to overwrite default_xx methods
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]     || default_chain
    @tire_size  = args[:tire_size] || default_tire_size
  end

  def default_chain       # <- common default
    '10-speed'
  end
end

class RoadBike < Bicycle
  # ...
  def default_tire_size   # <- subclass default
    '23'
  end
end

class MountainBike < Bicycle
  # ...
  def default_tire_size   # <- subclass default
    '2.1'
  end
end

############## Page 126 ##############
# works.
road_bike = RoadBike.new(
              size:       'M',
              tape_color: 'red' )

road_bike.tire_size     # => '23'
road_bike.chain         # => "10-speed"

mountain_bike = MountainBike.new(
                  size:         'S',
                  front_shock:  'Manitou',
                  rear_shock:   'Fox')

mountain_bike.tire_size # => '2.1'
road_bike.chain         # => "10-speed"
