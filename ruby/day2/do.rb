class Tree
  attr_accessor :children, :node_name
  
  
  def initialize(structure)
   structure.each do |node_name, children|
    @node_name = node_name
    @children =  children.empty? 
     ? []
     : children.map {|child, grandchildren| Tree.new({child => grandchildren}) }
    
   end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end


#The Tree class was interesting, but it did not allow you to specify a new
#tree with a clean user interface. Let the initializer accept a nested
#structure of hashes. You should be able to specify a tree like this:
#{'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
#'child 4' => {} } } }.

tree = Tree.new({
  'grandpa' => { 
    'dad' => {
      'child 1' => {}, 
      'child 2' => {} 
    }, 
    'uncle' => {
      'child 3' => {},
      'child 4' => {} 
    } 
  } 
})

tree.visit_all { |n| puts n.node_name }




