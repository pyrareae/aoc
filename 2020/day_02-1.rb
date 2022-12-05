data = open('day_02_data').readlines

class Pw
  def initialize(raw)
    @raw, @min, @max, @pol, @pw = *raw.match(/(\d+)-(\d+) (\w): (.*)/)
    @min, @max = [@min, @max].map(&:to_i)
  end

  def valid?
    (@min..@max).cover? @pw.scan(@pol).count
  end
end

puts data.reduce(0) { |acc, pw| Pw.new(pw).valid? ? acc+1 : acc }