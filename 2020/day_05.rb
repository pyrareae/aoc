data = open('day_05_data').readlines

def decode code
  y = code[0...7]
  x = code[7..-1]

  y_range = [0,127]
  x_range = [0,7]

  dec = lambda do |base, range|
    range = range.dup
    base.split('').each do
      dist = range.max - range.min
      next if dist < 1
      if /F|L/ =~ _1
        range[1] = range[0] + dist/2
      else
        range[0] += dist/2 + 1
      end
    end
    range.first
  end

  [dec[y, y_range], dec[x, x_range]]
end

def id dat
  y,x=*dat
  (y*8) + x
end

puts "part 1: #{data.map{id decode _1}.max}"

puts "part 2: #{data.map{id decode _1}.sort.each_cons(2).find{_2-_1==2}.yield_self{_1[0]+1}}"