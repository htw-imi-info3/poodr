
############## Page 127 ##############
# but there's a booby trap: what happens if there is a new
# bike type:
class RecumbentBike < Bicycle
  def default_chain
    '9-speed'
  end
end

bent = RecumbentBike.new
# NameError: undefined local variable or method
#   `default_tire_size'

############## Page ??? ##############
  # This line of code is a time bomb
  @tire_size  = args[:tire_size]  || default_tire_size

############## Page 128 ##############
class Bicycle
  #...
  def default_tire_size
    raise NotImplementedError
  end
end

############## Page 128 ##############
# there are no abstract methods in ruby
# raise exception to provide useful error message
bent = RecumbentBike.new
#  NotImplementedError: NotImplementedError

############## Page 128 ##############

class Bicycle
  #...
  def default_tire_size
    raise NotImplementedError,
          "This #{self.class} cannot respond to:"
  end
end
############## Page 129 ##############
bent = RecumbentBike.new
#  NotImplementedError:
#    This RecumbentBike cannot respond to:
#      `default_tire_size'

