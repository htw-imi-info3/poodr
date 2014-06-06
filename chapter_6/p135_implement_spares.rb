

############## Page 135 ##############
class Bicycle
  # ...
  def spares
    { tire_size: tire_size,
      chain:     chain}.merge(local_spares)
  end

  # hook for subclasses to override
  def local_spares
    {}
  end

end

class RoadBike < Bicycle
  # ...
  def local_spares
    {tape_color: tape_color}
  end

end

############## Page ??? ##############
# Full listing for above (next one is the complete, skip to that)
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]      || default_chain
    @tire_size  = args[:tire_size]  || default_tire_size
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def spares
    { tire_size: tire_size,
      chain:     chain}.merge(local_spares)
  end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end

road_bike = RoadBike.new(
              size:       'M',
              tire_size:  25,
              tape_color: 'red' )
road_bike.spares
# -> {:tire_size   => 25,
#     :chain       => "10-speed",
#     :tape_color  => "red"}
