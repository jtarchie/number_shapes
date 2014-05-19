class Point < Struct.new(:x, :y, :active)
  
end

class Shape < Struct.new(:points)

end

class Map < Struct.new(:points)
  def self.from_grid(grid)
    lines = grid.chomp.split("\n")
    points = lines.each_with_index.map do |line, y|
      line.split('').each_with_index.map do |char, x|
        Point.new(x,y, char == "*")
      end
    end
    Map.new(points)
  end

  def shapes
    @shapes ||= begin
                  points.flatten.select(&:active)
                end
  end
end
