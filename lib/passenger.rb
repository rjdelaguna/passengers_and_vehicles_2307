class Passenger
  attr_reader :name, :age

  def initialize(info)
    @name = info["name"]
    @age = info["age"]
    @adult = adult?
    @driver = false
  end

  def adult?
    if @age > 17
      @adult = true
    else
      false
    end
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end
end