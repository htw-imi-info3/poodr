require_relative 'p126_refactoring_4_init_with_template'
puts "in booby trap"
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

