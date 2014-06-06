
############## Page ??? ##############
# how to provide a spare method?
class MountainBike < Bicycle
  # ...
  def spares
    super.merge({rear_shock:  rear_shock})
  end
end

############## Page ??? ##############
mountain_bike.spares
# NoMethodError: super: no superclass method `spares'

############## Page 123 ##############
class RoadBike < Bicycle
  # ...
  def spares
    { chain:        '10-speed',
      tire_size:    '23',
      tape_color:   tape_color}
  end
end

############## Page 125 ##############
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]
    @tire_size  = args[:tire_size]
  end
  # ...
end
