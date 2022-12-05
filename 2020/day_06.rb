$/='' # "stealing" samperstand's paragraph mode, and extreme chaining style >:3

open('day_06_data')
  .each_line
  .map(&:chomp)
  .map(&:downcase)
  .tap do |s|
    s.map{|line| [*'a'..'z'].map{|l| !!line[l]}.count{_1}}
     .tap{puts "Part 1: #{_1.sum}"}
  end
  .map{_1.split("\n").reduce{|memo, el| memo.split('').filter{|letter| el.split('').include? letter}.join}}
  .map(&:length)
  .sum
  .tap{puts "Part 2: %s" % _1}