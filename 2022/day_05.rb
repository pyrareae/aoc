require_relative "mew"

announce_part_one
data = Mew.data File.open("2022/day_05_input.txt")
def format_stacks data
  data
    .take_while{_1 != ''} # until blank line
    .map{_1.split ''} # to array
    .transpose # rotate
    .map{_1.filter{|char| char[/[A-Z]/]}} # pluck out the lines with letters
    .filter{_1.length > 0} # clear blanks
    .compact
end

stacks = format_stacks data

data
  .drop_while{!_1['move']}.tap{$cmd = _1}
  .map{/(\d+).*(\d+).*(\d+)/.match(_1)[1..].map(&:to_i)}
  .each.with_index do |(qty, from, to), i|
    stacks[to-1].unshift(stacks[from-1].shift(qty).reverse).flatten!
  end
stacks.map(&:first).join.ps

announce_part_two
stacks = format_stacks data
data
  .drop_while{!_1['move']}.tap{$cmd = _1}
  .map{/(\d+).*(\d+).*(\d+)/.match(_1)[1..].map(&:to_i)}
  .each.with_index do |(qty, from, to), i|
    stacks[to-1].unshift(stacks[from-1].shift(qty)).flatten!
  end
stacks.map(&:first).join.ps
