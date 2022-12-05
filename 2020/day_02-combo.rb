data = open('day_02_data').readlines

class Pw
  def initialize(raw)
    @raw, @min, @max, @pol, @pw = *raw.match(/(\d+)-(\d+) (\w): (.*)/)
    @min, @max = [@min, @max].map(&:to_i)
  end

  def valid_a?
    (@min..@max).cover? @pw.scan(@pol).count
  end

  def valid_b?
    (@pw[@min-1] == @pol) ^ (@pw[@max-1] == @pol)
  end
end

# puts data.reduce(0) { |acc, pw| Pw.new(pw).valid_a? ? acc+1 : acc }
# puts data.reduce(0) { |acc, pw| Pw.new(pw).valid_b? ? acc+1 : acc }

puts data.reduce([0,0]) { |acc, line| pw = Pw.new(line); [acc[0] + (pw.valid_a? ? 1:0), acc[1] + (pw.valid_b? ? 1:0)] }