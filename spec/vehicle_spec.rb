require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    # => #<Passenger:0x00007fe0da1ec450...>
    @jude = Passenger.new({"name" => "Jude", "age" => 20})    
    # => #<Passenger:0x00007fe0da2730e0...>
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
    # => #<Passenger:0x00007fe0da2cf1b0...>
  end

  describe '#initialize' do
    it 'is a member of the vehicle class' do

      expect(@vehicle).to be_a Vehicle
    end

    it 'has readable attributes' do

      expect(@vehicle.year).to eq("2001")
      expect(@vehicle.make).to eq("Honda")
      expect(@vehicle.model).to eq("Civic")
    end
  end

  describe '#speeding?' do
    it 'can identify if the vehicle is speeding' do

      expect(@vehicle.speeding?).to eq(false)
    end

    it 'can be set to speed' do
      @vehicle.speed

      expect(@vehicle.speeding?).to eq(true)
    end
  end

  describe '#add_passenger' do
    it 'begins with no passengers' do

      expect(@vehicle.passengers).to eq([])
    end

    it 'can add passengers' do
      @vehicle.add_passenger(@charlie)    
      @vehicle.add_passenger(@jude)    
      @vehicle.add_passenger(@taylor)    

      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end
  end

  describe '#num_adults' do
    it 'can return the number of adults in the vehicle' do

      expect(@vehicle.num_adults).to eq(2)
    end
  end
end