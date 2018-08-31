class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc ||= Proc.new{ |x,y| x <=> y}
    @store = []
  end

  def count
    store.length
  end

  def extract
    raise "no element to extract" if count == 0

    val = store[0]

    if count > 1
      store[0] = store.pop
      BinaryMinHeap.heapify_down(store, 0, count)
    else
      store.pop
    end

    val
  end

  def peek
    
  end

  def push(val)
    @store << val
    self.class.heapify_up(store, self.count - 1, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    left = (2 * parent_index) + 1
    right = (2 * parent_index) + 2

    [left, right].select {|idx| idx < len}

  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x,y| x <=> y}

    left, right = BinaryMinHeap.child_indices(len, parent_idx)
    parent_value = array[parent_idx]

    results = []
    results << array[left] if left
    results << array[right] if right

    if results.all? { |child| prc.call(parent_value, child) <= 0 }
      # Leaf or both children_vals <= parent_val. As a convenience,
      # return the modified array.
      return array
    end

    swap = nil
    if results.length == 1
      swap = left
    else
      swap = prc.call(results[0], results[1]) == -1 ? left : right
    end

    array[parent_idx], array[swap] = array[swap], parent_value
    heapify_down(array, swap, len, &prc )

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|x,y| x <=> y }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    child_val, parent_val = array[child_idx], array[parent_idx]
    if prc.call(child_val, parent_val) >= 0
      return array
    else
      array[child_idx], array[parent_idx] = parent_val, child_val
      heapify_up(array, parent_idx, len, &prc)
    end
  end
end
