data = open('day_01-1_data').readlines

result = catch :done do
  data.each do |a|
    data.each do |b|
      data.each do |c|
        ai, bi, ci = [a,b,c].map(&:to_i)

        next unless ai+bi+ci == 2020
        throw :done, [ai,bi,ci]
      end
    end
  end
end

exit unless result

puts result.reduce &:*
puts "https://adventofcode.com/2020/day/1#part2"