
require './lib/passenger'

RSpec.describe Passenger do
  before(:each) do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe ' #initialize' do
    it 'is a member of the passenger class' do

      expect(charlie).to be_a Passenger
    end

    it 'has readable attributes' do

      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)
    end
  end

  describe '#adult?' do
    it 'can identify if the passenger is 18 or older' do

      expect(charlie.adult?).to eq(true)
      expect(taylor.adult?).to eq(false)
    end
  end

  describe '#driver?' do
    it 'can identify or assign the driver' do

      expect(charlie.driver?).to eq(false)
      
      charlie.drive

      expect(charlie.driver?).to eq(true)
    end
  end
end
