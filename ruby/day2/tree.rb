
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children = [])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each do |c|
      c.visit_all &block
    end
  end

  def visit(&block)
    block.call self
  end
end


ruby_tree = Tree.new("Ruby", [
  Tree.new("foo"),
  Tree.new("bar")
])

puts "Starting visite root node"
ruby_tree.visit {|node| puts node.node_name}
 
puts "visiting all node"
ruby_tree.visit_all {|node| puts node.node_name}


