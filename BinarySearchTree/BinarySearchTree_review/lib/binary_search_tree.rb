# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree

  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_into_tree(@root, value)
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?

    if tree_node.value == value
      return tree_node
    elsif value < tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end

  end

  def delete(value)
    @root = remove_from_tree(@root, value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right
      max_node = maximum(tree_node.right)
    else
      max_node = tree_node
    end

    max_node
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?

    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    if left_depth > right_depth
      return left_depth + 1
    else
      return right_depth + 1
    end


  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    (left_depth - right_depth).abs < 2 && is_balanced?(tree_node.right) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right)
    end

    arr

  end


  private
  # optional helper methods go here:

  def insert_into_tree(tree_node, value)

    return BSTNode.new(value) if tree_node.nil?

    if value <= tree_node.value
      tree_node.left = insert_into_tree(tree_node.left, value)
    else
      tree_node.right = insert_into_tree(tree_node.right, value)
    end

    tree_node
  end


  def remove_from_tree(tree_node, value)

    if value == tree_node.value
      remove(tree_node)
    elsif value < tree_node.value
      tree_node.left = remove_from_tree(tree_node.left, value)
    else
      tree_node.right = remove_from_tree(tree_node.right, value)
    end
  end

  def remove(node)
    if node.right.nil? && node.left.nil?
      node = nil
    elsif node.left && node.right.nil?
      node = node.left
    elsif node.left.nil? && node.right
      node = node.right
    else
      node = replace_parent(node)
    end
  end

  def replace_parent(node)
    replacement_node = maximum(node.left)

    if replacement_node.left
      node.left.right = replacement_node.left
    end

    replacement_node.left = node.left
    replacement_node.right = node.right

    replacement_node


  end

end
