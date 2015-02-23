class Column
  attr_accessor :elements
  attr_reader :number
  
  def initialize(number, cave_rows)
    @number = number
    @elements = cave_rows.map { |row| row[number] }
  end
  
  def amount_of_water_in
    if air_is_under_water?
      Element.water
    else
      amount_of_water
    end
  end
  
  def air_is_under_water?
    return false unless has_water?
    elements[first_water..-1].include? Element.air
  end
  
  def has_water?
    amount_of_water > 0
  end
  
  private
  
  def first_water
    elements.index(Element.water)
  end
  
  def amount_of_water
    elements.count(Element.water)
  end
end
