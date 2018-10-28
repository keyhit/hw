require 'pry'
class Test
  def initalizer(actual, expected, comment)
    @actual   = actual
    @expected = expected
    @comment  = comment
  end

  def self.result(expected, actual, comment)
    if actual == expected
      puts "Data comparison PASSED in #{comment}."
    else
      puts "Data comparison FAILED in  #{comment}."
    end
  end
end

class Cube
  attr_accessor :edge

  def self.volume(edge)
    edge**3
  end

  def self.cube_plane_square(edge)
    edge**2
  end
end

class Average
  attr_accessor :numbers

  def self.count(numbers)
    summury_elements_array = numbers.inject { |sum, n| sum + n }.to_f
    summury_elements_array / numbers.length.to_f
  end
end

class GeometricMean
  attr_accessor :numbers

  def self.count(numbers)
    multiple = numbers.inject(1) { |elem, n| elem * n }
    result = Math.exp(Math.log(multiple) / numbers.length.to_f)
    result.round(4)
  end
end

task = '1.3'
puts "----| 1 | - #{task} -----"
unit = 'meter'
units = 'meters'
edge_cube_length = 2

volume = Cube.volume(edge_cube_length)
square = Cube.cube_plane_square(edge_cube_length)

condition = 'We have length edge of cube equal = '\
  "#{edge_cube_length} #{units}."\
  ' Find volume and square of cube.'

puts condition
puts "Volume of cube = #{volume} cubic #{unit}."
puts "Cube plane square = #{square} square #{units}."
puts
actual = { volume: volume, square: square }
expect = { volume: 8, square: 4 }
comment = task
Test.result(actual, expect, comment)
puts

task = '1.4'
puts "----| 2 | - #{task} -----"
number1 = 30
number2 = 19
numbers = [number1, number2]

average = Average.count(numbers)
geometric = GeometricMean.count(numbers)

puts "We have two numbers #{number1} and #{number2}."\
  'Find average and geometric mean'
puts "Average #{number1} and #{number2} is #{average}"
puts "Geometric mean #{number1} and #{number2} is #{geometric}"
puts
actual = { average: average, geometric: geometric }
expect = { average: 24.5, geometric: 23.8747 }
comment = task
Test.result(actual, expect, comment)
puts

puts '----| 3 | - Task 1.5 -----'

number1 = -30
number2 = 19

puts "We have two numbers #{number1} and #{number2}."

def average_number2(arg1, arg2)
  arg1 + arg2 / 2
end

def module_geometric_mean(arg1, arg2)
  Math.sqrt(arg1.abs * arg2.abs)
end

average = average_number2(number1, number2)
geometric = module_geometric_mean(number1, number2)

puts "Average #{number1} and #{number2} is #{average}"
puts "Geometric mean #{number1} and #{number2} by module is #{geometric}"
puts

puts '----| 4 | - Task 1.6 -----'

cathetus1 = 3
cathetus2 = 2

puts "Cathetus 1 = #{cathetus1} sm and cathetus 2 = #{cathetus2} sm."

def hypotenuse_count(arg1, arg2)
  Math.sqrt(arg1**2 + arg2**2)
end

def triangle_square(arg1, arg2)
  arg1 * arg2 / 2
end

hypotenuse = hypotenuse_count(cathetus1, cathetus2)
square = triangle_square(cathetus1, cathetus2)

puts "Hypotenuse is #{hypotenuse} sm."
puts "Triangle square is #{square} square sm."
puts

puts '----| 5 | - Task 1.12 -----'

triangle_side = 5

puts "Triangle side = #{triangle_side} sm"

def triangle_square_1_12(arg)
  arg**2 * Math.sqrt(3) / 4
end

square1 = triangle_square_1_12(triangle_side)

puts "Triangle square is #{square1} square sm."
puts

puts '----| 6 | - Task 1.15 -----'

hypotenuse1 = 20
cathetus3 = 10

puts "Hypotenuse = #{hypotenuse1} sm, cathetus = #{cathetus3} sm."

def find_second_cathetus(hyp, cath)
  Math.sqrt(hyp**2 - cath**2)
end
second_cathetus = find_second_cathetus(hypotenuse1, cathetus3)

def triangle_perimeter(side1, side2, side3)
  side1 + side2 + side3
end

perimeter = triangle_perimeter(second_cathetus, hypotenuse1, cathetus3)

def square_triangle(cat1, cat2)
  cat1 * cat2 / 2
end

square3 = square_triangle(cathetus3, second_cathetus)

def circle_radius(square3, perimeter)
  square3 / (perimeter / 2)
end

radius = circle_radius(square3, perimeter)

puts "Second cathetus = #{second_cathetus} sm."
puts "Perimeter = #{perimeter} sm."
puts "Square = #{square3} square sm."
puts "Radius = #{radius}sm."
puts

puts '----| 7 | - Task 1.16 -----'

circle_length = 50

def cout_circle_radius(circle_length)
  circle_length / (2 * 3.14)
end

radius = cout_circle_radius(circle_length)

def count_circle_square(radius)
  (radius**2) * 3.14
end

circle_square = count_circle_square(radius)

puts "Circle length = #{circle_length} sm."
puts "Circle radius = #{radius} sm."
puts "Circle square = #{circle_square} square sm."
puts

# puts '----| 8 | - Task 1.23 -----'

# triangle_side_a = 50
# triangle_side_b = 30
# triangle_side_c = 40

# triangle_sides = [triangle_side_a, triangle_side_b, triangle_side_c]

# puts triangle_sides

# class Triangle
#   def initialize(triangle_sides)
#     @triangle_sides = triangle_sides
#   end

#   def count_half_perimeter
#     @triangle_sides.reduce(:+) / 2
#   end

#   def count_triangle_heights
#     hp = count_half_perimeter
#     puts "hp = #{hp}"
#     puts "a = #{@triangle_sides[0]}"
#     @triangle_sides.each do |side|
#       heigth =
#         (2.fdiv side) * Math.sqrt(hp * (hp - @triangle_sides[0]) * (hp - @triangle_sides[1]) * (hp - @triangle_sides[2]))

#       puts "Triangle sides = #{heigth}."
#     end
#   end
# end

# triangle1 = Triangle.new(triangle_sides)
# triangle1.count_triangle_heights
# puts

# class SavingAccount
#   def initialize(balance=0)
#     @balance = balance
#   end
# 
#   def balance
#     @balance
#   end
# 
#   def balance=(new_amount)
#     @balance = new_amount
#   end
# 
#   def deposit(amout)
#     @balance += amout
#   end
# 
#   @@bank_name = 'My bank'
# 
#   def self.bank_name
#     @@bank_name
#   end
# end
# 
# my_account = SavingAccount.new(20)
# p my_account.balance
# p my_account.balance = 10
# p SavingAccount.bank_name
# 
# class String
#   def curvi?
#     'AEFHIKLMNTVWXYZ'.include?(self.upcase)
#   end
# end
# 
# curv = String.new
# p curv.curvi?



actual = { data1: 1, data2: 2 }
expect = { data1: 1, data2: 2 }
comment = 'Tast 1.12'

Test.result(actual, expect, comment)

actual = { data2: 1, data3: 2 }
expect = { data2: 1, data3: 2 }
comment = 'Tast 1.11'

Test.result(actual, expect, comment)
