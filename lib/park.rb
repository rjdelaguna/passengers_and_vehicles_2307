class Park
  attr_reader :name, :admission, :vehicles, :revenue

  def initialize(name, admission)
    @name = name
    @admission = admission
    @vehicles = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
    @revenue += (vehicle.num_adults * @admission)
  end

  def passengers
    passengers = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        passengers << passenger
      end
    end
    passengers
  end
end