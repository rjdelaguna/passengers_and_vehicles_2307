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

  def all_attendees
    attendees = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        attendees << passenger.name
      end
    end
    attendees
  end

  def minors
    minors = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        if !passenger.adult?
          minors << passenger.name
        end
      end
    end
    minors
  end

  def adults
    adults = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        if passenger.adult?
          adults << passenger.name
        end
      end
    end
    adults
  end
end