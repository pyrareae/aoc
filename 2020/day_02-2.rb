data = open('day_02_data').readlines

class Pw
  def initialize(raw)
    @raw, @min, @max, @pol, @pw = *raw.match(/(\d+)-(\d+) (\w): (.*)/)
    @min, @max = [@min, @max].map(&:to_i)
  end

  def valid?
    (@pw[@min-1] == @pol) ^ (@pw[@max-1] == @pol)
  end
end

puts data.reduce(0) { |acc, pw| Pw.new(pw).valid? ? acc+1 : acc }