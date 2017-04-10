# 3-dimensional matrix needed for rotations
class  Matrix
  include VectorOps
  attr_reader :rows, :columns
  def initialize(array)
    super(array.flatten)
    if array.first.is_a?(Array)
      @rows = array.length
      @columns = array.first.length
   else
     @rows = Math.sqrt(array.length).to_i
     @columns = array.length / @rows
   end
  end

  def row(idx)
    @coordinates[@columns * idx, @rows]
  end

  def *(vector)
    return super unless vector.is_a?(Vector)

    Vector.new(@rows.times.map do |row_idx|
      row(row_idx).each_with_index.reduce(0) do |acc, (a, col_idx)|
        acc + a * vector[col_idx]
      end
    end)
  end
end
