############## Page 107 ##############
# There are road bikes only
class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end

  # every bike has the same defaults for
  # tire and chain size
  def spares
    return { chain:        '10-speed',
      tire_size:    '23',
      tape_color:   tape_color}
  end

  # Many other methods...
end

bike = Bicycle.new(
        size:       'M',
        tape_color: 'red' )

puts bike.size     # -> 'M'
puts bike.spares.inspect
# -> {:tire_size   => "23",
#     :chain       => "10-speed",
#     :tape_color  => "red"}
