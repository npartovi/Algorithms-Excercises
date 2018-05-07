class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value)
    @value = value
  end

  def add_val(node, value)
    if value <= @value
      if @left.nil?
        @left = node
        @left.parent = self
      else
        @left.add_val(node, value)
      end

    elsif value > @value
      if @right.nil?
        @right = node
        @right.parent = self
      else
        @right.add_val(node, value)
      end
    end
  end

  def find_val(value)
    if value == @value
      self
    
    elsif value <= @value
      if @left.nil?
        nil
      else
        @left.find_val(value)
      end
    
    elsif value > @value
      if @right.nil?
        nil
      else
        @right.find_val(value)
      end
    end
  end

  def remove_val(value)
    removed = find_val(value)
    
    # no children
    if removed.left.nil? && removed.right.nil?
      if removed.parent.left == removed
        removed.parent.left = nil
      elsif removed.parent.right == removed
        removed.parent.right = nil
      end
      
    # two children
    elsif removed.left && removed.right
      promote = removed.left.get_max
      p removed.value
      p promote.value
      promote.remove_val(promote.value)
      
      if removed.parent.left == removed
        removed.parent.left = promote
      else
        removed.parent.right = promote
      end
      promote.parent = removed.parent
      
      
    # one child
    elsif removed.left
      if removed.parent.left == removed
        removed.parent.left = removed.left
      else
        removed.parent.right = removed.left
      end
      removed.left.parent = removed.parent
      
    elsif removed.right
      if removed.parent.left == removed
        removed.parent.left = removed.right
      else
        removed.parent.right = removed.right
      end
      removed.right.parent = removed.parent
      
    end
  end

  def get_max
    if @right.nil?
      self
    else
      @right.get_max
    end
  end

  def get_depth
    return 0 if @left.nil? && @right.nil?
    children = []
    children << @left.get_depth if @left
    children << @right.get_depth if @right
    1 + children.max
  end

  def check_balance
    return true if @left.nil? && @right.nil?
    
    depth_l = @left ? @left.get_depth : 0
    depth_r = @right ? @right.get_depth : 0
    return false if (depth_l - depth_r).abs > 1
    
    bal_left = @left ? @left.check_balance : true
    bal_right = @right ? @right.check_balance : true

    bal_left && bal_right
  end

  def traverse
    left = @left ? @left.traverse : []
    right = @right ? @right.traverse : []
    left + [@value] + right
  end
end