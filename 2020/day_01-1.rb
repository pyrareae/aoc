data = open('day_01-1_data').readlines

result = catch :done do
  data.each do |a|
    data.each do |b|
      next unless a.to_i + b.to_i == 2020

      throw :done, [a.to_i, b.to_i]
    end
  end
end

exit unless result

puts "#{result[0]} + #{result[1]} = #{result[0] + result[1]}"
puts "#{result[0]} * #{result[1]} = #{result[0] * result[1]}"
puts "https://adventofcode.com/2020/day/1"