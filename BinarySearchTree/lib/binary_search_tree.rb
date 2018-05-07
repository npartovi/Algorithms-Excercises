require 'bst_node'

# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = BSTNode.new(value)
    if @root.nil?
      @root = new_node
    else
      @root.add_val(new_node, value)
    end
  end

  def find(value, tree_node = @root)
    @root.nil? ? nil : tree_node.find_val(value)
  end

  def delete(value)
    if @root.nil?
      nil
    elsif @root.left.nil? && @root.right.nil?
      @root = nil
    else
      @root.remove_val(value)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    @root.nil? ? nil : tree_node.get_max
  end

  def depth(tree_node = @root)
    @root.nil? ? 0 : tree_node.get_depth
  end 

  def is_balanced?(tree_node = @root)
    tree_node.check_balance
  end

  def in_order_traversal(tree_node = @root, arr = [])
    tree_node.traverse
  end


  private
  # optional helper methods go here:

end