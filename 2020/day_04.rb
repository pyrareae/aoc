data = open('day_04_data')

parsed = data.readlines.inject([[]]) {|memo, line| line.chomp.empty? ? memo << [] : memo[-1] << line; memo}.map{|el| el.join ' '}.map{|l| l.tr("\n",'')}

tokens = %w[byr iyr eyr hgt hcl ecl pid]

puts 'part 1'
puts parsed.filter {|p| tokens.map{|t| !p[t].nil? && !p[t].empty?}.all?}.count

validations = {
  'byr' => -> s {(1920..2002).cover?(s.to_i)},
  'iyr' => -> s {(2010..2020).cover?(s.to_i)},
  'eyr' => -> s {(2020..2030).cover?(s.to_i)},
  'hgt' => -> s {s.match(/(\d+)(cm|in)/){|match| (_,h,u) = match.to_a; u=='in' ? ((59..79).cover? h.to_i) : ((150..193).cover? h.to_i)}},
  'hcl' => -> s {s.match? /\#[0-9a-fA-F]{6}/},
  'ecl' => -> s {s.match?(/\w{3}/) && %[amb blu brn gry grn hzl oth].include?(s)},
  'pid' => -> s {s.match?(/^\d{9}$/)},
}

puts 'part 2'
puts(
parsed.filter do |line| 
  validations.map do |token, vali|
    line.match(/(#{token}): *([\w\d#]+)/) do |match|
      value = match[2]
      vali[value]
    end
  end.all?
end.count
)