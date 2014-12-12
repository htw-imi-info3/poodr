require_relative 'p107_road_bikes_only'
############## Page 115 ##############
# First try at inheritance: MountainBike extends the former Bicycle
# which is indeed a Roadbike
class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

############## Page 115 ##############
mountain_bike = MountainBike.new(
                  size:         'S',
                  front_shock:  'Manitou',
                  rear_shock:   'Fox')

puts "here comes the mountain_bike"
puts mountain_bike.size # -> 'S'

puts mountain_bike.spares
# -> {:tire_size   => "23",       <- wrong!
#     :chain       => "10-speed",
#     :tape_color  => nil,        <- not applicable
#     :front_shock => 'Manitou',
#     :rear_shock  => "Fox"}

