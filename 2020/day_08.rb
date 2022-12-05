data = open('day_08_data').each_line.map{[*_1.split(' '), 0].tap{|lst| lst[1] = lst[1].to_i}}

def execute(data)
  pointer = 0
  acc = 0
  dirty = true
  loop do
    head = data[pointer]
    if head.nil?
      dirty = false
      break
    end
    head[2] += 1
    break if head[2] > 1
    case head.first
    when 'acc'
      acc += head[1]
      pointer+=1
    when 'jmp'
      pointer += head[1]
    when 'nop'
      pointer+=1
    end
  end
  [acc, dirty]
end

def flip(code)
  raise "#{code} not flippible" unless %w[jmp nop].include? code
  code == 'nop' ? 'jmp' : 'nop'
end

def reset data
  data.each {_1[2] = 0}
end

puts "Part 1: %s" % execute(data)[0]

# data.each_with_index do |instruction, line_num|
#   next unless instruction[0].match?(/nop|jmp/)
#   original = instruction[1]
#   instruction[1] = instruction[1]=='nop' ? 'jmp' : 'nop'

#   ret_val = execute(data)
#   unless ret_val[1]
#     puts "Part 2: %s" % ret_val[0]
#     break
#   end

#   instruction[1] = original
# end
data.length.times do
  reset data
  next unless data[_1][0].match?(/nop|jmp/)
  data[_1][0] = flip data[_1][0]
  ret = execute data
  unless ret[1]
    puts "Part 2: %s" % ret[0]
    break
  end
  data[_1][0] = flip data[_1][0]
end