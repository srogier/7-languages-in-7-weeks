#Print the contents of an array of sixteen numbers, four numbers at a
#time, using just each. Now, do the same with each_slice in Enumerable.

(1..16).each do |x|
  #kind of bufferizing
  print x , ' '
  #print each 4 iteration
  puts if x % 4 == 0
end

(1..16).each_slice(4) { |a| puts a.join(' ')}



#The Tree class was interesting, but it did not allow you to specify a new
#tree with a clean user interface. Let the initializer accept a nested
#structure of hashes. You should be able to specify a tree like this:
#{'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
#'child 4' => {} } } }.

class Tree
  attr_accessor :children, :node_name
  
  
  def initialize(structure)
   structure.each do |node_name, children|
    @node_name = node_name
    @children =  [] if children.empty? 
    @children =  children.map {|child, grandchildren| Tree.new({child => grandchildren}) } if !children.empty? 
    
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


#Write a simple grep that will print the lines of a file having any occur-
#rences of a phrase anywhere in that line. You will need to do a simple
#regular expression match and read lines from a file. (This is surprisingly
#simple in Ruby.) If you want, include line numbers.

puts ' ---- file with regular expression ---- '

IO.foreach('grep') do |line| 
  puts line if line.match /foo/i 
end 








