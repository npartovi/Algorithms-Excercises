class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if arraylength <= 1

    pivot = array[0]

    left = array[1..-1].select{|el| el <= pivot }
    right = array[1..-1].select{|el| el > pivot}

    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    
    return array if length <= 1

    pivot_idx = self.partition(array, start, length, &prc)
    left_partition_len = pivot_idx - start
    right_partition_len = length - pivot_idx - 1

    self.sort2!(array, start, left_partition_len, &prc)
    self.sort2!(array, (pivot_idx + 1), right_partition_len, &prc)

    array

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    pivot_idx = start
    pivot_el = array[start]
    range = (start + 1...start + length)

    range.each do |idx|
      if prc.call(pivot_el, array[idx]) > 0
        pivot_idx += 1
        array[pivot_idx], array[idx] = array[idx], array[pivot_idx]
        
      end
    end
    
    array[pivot_idx], array[start] = array[start], array[pivot_idx]
    pivot_idx

  end
end
