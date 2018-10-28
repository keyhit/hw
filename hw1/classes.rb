require 'colorize'
require 'pry'

class Test
  def initalizer(actual, expected, comment)
    @actual   = actual
    @expected = expected
    @comment  = comment
  end

  def self.result(expected, actual, comment)
    if actual == expected
      puts "Data comparison PASSED in #{comment} task.".green
    else
      puts "Data comparison FAILED in  #{comment} task.".red
    end
  end
end

class Cube
  def self.volume(edge)
    edge**3
  end

  def self.cube_plane_square(edge)
    edge**2
  end
end

class Average
  def self.count(numbers)
    summury_elements_array = numbers.inject { |sum, n| sum + n }.to_f
    summury_elements_array / numbers.length.to_f
  end
end

class GeometricMean
  def self.count(numbers)
    multiple = numbers.inject(1) { |elem, n| elem * n }
    result = Math.exp(Math.log(multiple) / numbers.length.to_f)
    result.round(4)
  end
end

class GeometricMeanModule
  def self.count(numbers)
    multiple = numbers.inject(1) { |elem, n| elem.abs * n.abs }
    result = Math.exp(Math.log(multiple) / numbers.length.to_f)
    result.round(4)
  end
end

class Triangle
  # angle must be hash
  # side must be hash
  # triangle sides must have key a:, b:, c:
  # side a: is hypotenuse
  def initialize(angle = 0, side = 0)
    @angle = angle
    @side = side
  end

  def type_definer
    unless @angle.is_a?(Hash)
      begin
        raise 'variable @angle must be a Hash!!!'
      rescue StandardError => e
        puts e.message
        puts e.backtrace.inspect
      end
    end

    if @angle.value?(90) && @side[:b] == @side[:c]
      'angle_90_same_cathetus'
    elsif @angle.value?(90) && @side[:b] != @side[:c]
      'Triangle_90_differ_cathetus'
    elsif @angle.value?(90) && @angle.value?(60) && @side[:b] != side[:c]
      'Triangle_90_differ_cathetus'
    elsif @angle.value?(60) && @side[:b] == @side[:c]
      'Right triangle'
    elsif @angle.value?(60) && @side[:b] != @side[:c]
      'Various side triangle 60'
    else
      'Various side triangle'
    end
  end

  def square
    case type_definer
    when 'Triangle_90_differ_cathetus'
      (@side[:b] * @side[:c] / 2).round(4)
    when 'Right triangle'
      (0.5 * @side[:a] * height).round(4)
    end
  end

  def radius_circle_inside_triangle
    (square / (perimeter / 2)).round(4)
  end

  def hypotenuse
    Math.sqrt(@side.values.max**2 + @side.values.min**2).round(4)
  end

  def cathetus
    hypotenuse = @side.values.max
    cathetus = @side.values.min
    Math.sqrt(hypotenuse**2 - cathetus**2).round(4)
  end

  def perimeter
    @side.values.inject { |sum, n| sum + n }.to_f.round(4)
  end

  def height
    small_kathetus = @side[:a].to_f / 2.to_f
    Math.sqrt(@side[:a]**2.to_f - small_kathetus**2).round(4)
  end
end

class Circle
  def initialize(circle_length)
    @circle_length = circle_length
  end

  def radius_by_length
    @circle_length / (2 * 3.14)
  end

  def square
    ((radius_by_length**2) * 3.14).round(4)
  end
end
