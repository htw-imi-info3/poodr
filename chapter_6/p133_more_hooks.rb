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

############## Page 133 ##############
# what happens if new type forgets to call super?
class RecumbentBike < Bicycle
  attr_reader :flag

  def initialize(args)
    @flag = args[:flag]  # forgot to send 'super'
  end

  def spares
    super.merge({flag: flag})
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

bent = RecumbentBike.new(flag: 'tall and orange')
puts "forgot to call super"
puts bent.spares
# -> {:tire_size => nil, <- didn't get initialized
#     :chain     => nil,
#     :flag      => "tall and orange"}

############## Page 134 ##############
# provide hook methods
class Bicycle

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]     || default_chain
    @tire_size  = args[:tire_size] || default_tire_size

    post_initialize(args)    # Bicycle both sends
  end

  def post_initialize(args)  # and implements this
    nil
  end
  # ...
end

class RoadBike < Bicycle

  def post_initialize(args)         # RoadBike can
    @tape_color = args[:tape_color] # optionally
  end                               # override it
  # ...
end

############## Page ??? ##############
# full listing for above
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]     || default_chain
    @tire_size  = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def spares
    { tire_size:  tire_size,
      chain:      chain}
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

  def spares
    super.merge({tape_color: tape_color})
  end

  def default_tire_size
    '23'
  end
end

road_bike = RoadBike.new(
              size:       'M',
              tire_size:  25,
              tape_color: 'red' )
puts "with more hooks"
puts road_bike.spares

