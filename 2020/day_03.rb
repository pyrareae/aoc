data = open('day_03_data').readlines

puts 'part 1'

puts (data.map(&:chomp).each_with_index.inject(0) do |acc, (line, index)|
  x = (index * 3) % line.length
  acc + (line[x] == '#' ? 1 : 0)
end)


puts 'part 2'
x = [
  [1,1],
  [3,1],
  [5,1],
  [7,1],
  [1,2]
].map do |(x,y)|
  data.map(&:chomp).each_with_index.inject(0) do |acc, (line, index)|
    next acc unless index % y == 0
    offset = (index/y * x) % line.length
    acc + (line[offset] == '#' ? 1 : 0)
  end
end

puts x.reduce(&:*)