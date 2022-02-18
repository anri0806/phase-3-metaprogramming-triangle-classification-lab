require 'pry'

class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate
    #omit self
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end

  end


  def greater_then_zero?
    [side1, side2, side3].all? {|s| s.positive?}
  end
  
  def inequality?
    (side1 + side2) > side3 && (side2 + side3) > side1 &&  (side1 + side3) > side2
  end

  # Trigger error if above 2 methods are false
  def validate
    # when those methods are true, raise error
    raise TriangleError unless greater_then_zero? && inequality?
  end

  class TriangleError < StandardError
  end

end
