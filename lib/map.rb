Point = Struct.new(:x, :y) do
  attr_accessor :shape
end

Map = Struct.new(:points) do
  def self.from_grid(grid)
    lines = grid.chomp.split("\n")
    points = lines.each_with_index.map do |line, y|
      line.split('').each_with_index.map do |char, x|
        Point.new(x, y) if char == "*"
      end
    end.flatten.compact
    Map.new(points)
  end

  def shapes_count
    @shapes_count ||= begin
                  current_shape = 0
                  points.each do |point|
                    unless point.shape
                      point.shape = neighboring_shape(point)
                      point.shape ||= (current_shape += 1)
                    end
                  end
                  current_shape
                end
  end

  private

  def neighboring_shape(point)
    point = point_at(point.x - 1, point.y) || point_at(point.x, point.y - 1)
    point.shape if point
  end

  def point_at(x, y)
    points.detect{|p| p.x == x && p.y == y}
  end
end
