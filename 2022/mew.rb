class Object
  def ps
    pp self
    self
  end

  def heading
    puts "\n=== #{self} ===\n\n"
    self
  end
end

class Mew
  def self.data(file=DATA)
    file.readlines.map(&:chomp)
  end
end

def announce_part_one
  "Part One".heading
end

def announce_part_two
  "Part Two".heading
end
