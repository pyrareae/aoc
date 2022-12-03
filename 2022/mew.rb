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
