require 'amazing_print'
require 'irb'
# BagQty = Struct.new :color, :qty
# BagRule = Struct.new :color, :allowed_bags
# BagLeaf = Struct.new :rule, :children
class Bag
  attr_accessor :color, :children
  def initialize color, children={}
    @color = color
    @children = Hash.new(0).merge children
  end
end

@data = open('day_07_data').each_line.map {_1.match(/(.*) contain (.*)\./); BagRule.new $1, $2.split(', ').map{|rule| BagQty.new rule[/\d* (.*bag)s?/,1], rule[/\d*/].to_i}}.to_a

def build_branch rule
  BagLeaf.new rule, @data.filter{|bag| bag.allowed_bags.any?{_1.color.match? rule.color}}
end

def build_tree rule
  build_branch(rule).children.map{x=build_tree _1; x&.empty? ? _1 : x}
end

tree = build_tree(BagRule.new(/shiny gold/, []))
def print_tree(els, depth=0)
  els.each
end

print_tree [tree]

puts flatten_tree(tree).count