require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe do
  before(:each) do
    @park = Park.new("Yellowstone", 100)
    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("2021", "Tesla", "Model 3")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @sam = Passenger.new({"name" => "Sam", "age" => 30})
    @billy = Passenger.new({"name" => "Billy", "age" => 5})
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle1.add_passenger(@taylor)
    @vehicle2.add_passenger(@sam)
    @vehicle2.add_passenger(@billy)
  end

  describe '#initialize' do
    it 'is a member of the park class' do

      expect(@park).to be_a Park 
    end

    it 'has readable attributes' do

      expect(@park.name).to eq("Yellowstone")
      expect(@park.admission).to eq(100)
      expect(@park.vehicles).to eq([])
      expect(@park.revenue).to eq(0)
    end
  end

  describe '#add_vehicle' do
    it 'can allow vehicles in the park' do
      @park.add_vehicle(@vehicle1)
      @park.add_vehicle(@vehicle2)
    
      expect(@park.vehicles).to eq([@vehicle1, @vehicle2])
    end

    it 'collects the price of admission for each adult in a vehicle' do
      @park.add_vehicle(@vehicle1)
      @park.add_vehicle(@vehicle2)

      expect(@park.revenue).to eq(300)
    end
  end

  describe '#passengers' do
    it 'can identify all passengers that are in the park' do
      @park.add_vehicle(@vehicle1)
      @park.add_vehicle(@vehicle2)
      expect(@park.passengers).to eq([@charlie, @jude, @taylor, @sam, @billy])
    end
  end
end
