require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle.rb'

class AboutTriangleProject2 < Neo::Koan
  # The first assignment did not talk about how to handle errors.
  # Let's handle that part now.
  
  class TriangleError < StandardError
  end
  
  def triangle(one, two, three)
    begin
      if invalidSideLength(one, two, three) || violatesTriangularRule(one, two, three)
        raise TriangleError
      end
      
      if (one == two) && (two == three) && (one == three)
        :equilateral
      else 
        if(one == two) || (two == three) || (one == three)
          :isosceles
        else
          :scalene
        end
      end
    end
  end
  
  def violatesTriangularRule(*sides)
    (sides[0] + sides[1] <= sides[2]) || (sides[0] + sides[2] <= sides[1]) || (sides[1] + sides[2] <= sides[0])
  end
  
  def invalidSideLength(*sides)
    (sides[0] <= 0) || (sides[1] <= 0) || (sides[2] <= 0)
  end
  
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
    # HINT: for tips, see http://stackoverflow.com/questions/3834203/ruby-koan-151-raising-exceptions
  end
end
