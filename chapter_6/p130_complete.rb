
############## Page 130 ##############
class RoadBike < Bicycle
  #
  def spares
    { chain:        '10-speed',
      tire_size:    '23',
      tape_color:   tape_color}
  end
end
############## Page 130 ##############
class MountainBike < Bicycle
  #
  def spares
    super.merge({rear_shock:  rear_shock})
  end
end
############## Page 130 ##############
class Bicycle
  #...
  def spares
    { tire_size:  tire_size,
      chain:      chain}
  end
end

############## Page 131 ##############
# complete implementations with super calls
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]      || default_chain
    @tire_size  = args[:tire_size]  || default_tire_size
  end

  def spares
    { tire_size:  tire_size,
      chain:      chain}
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplememtedError
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
    super.merge({ tape_color: tape_color})
  end

  def default_tire_size
    '23'
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock =  args[:rear_shock]
    super(args)
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end

  def default_tire_size
    '2.1'
  end
end

############## Page ??? ##############
##### Results for the above
road_bike = RoadBike.new(
              size:       'M',
              tape_color: 'red' )

road_bike.spares
# -> {:tire_size   => "23",
#     :chain       => "10-speed",
#     :tape_color  => "red"}

mountain_bike = MountainBike.new(
                  size:         'S',
                  front_shock:  'Manitou',
                  rear_shock:   'Fox')

mountain_bike.spares
# -> {:tire_size   => "2.1",
#     :chain       => "10-speed",
#     :rear_shock  => "Fox"}
