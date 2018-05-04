class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if arraylength <= 1

    pivot = rand(array.length)
    array[0], array[pivot] = array[pivot], array[0]

    left = array.select{|el| el < pivot}
    middle = array.select{|el| el == pivot}
    right = array.select{|el| el > pivot}

    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)

    prc ||= Proc.new{ |x,y| x <=> y }
    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - (left_length + 1)

    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array

  end

  def self.partition(array, start, length, &prc)

    prc ||= Proc.new{|x,y| x <=> y}

    rando_pivot = start + rand(length)

    array[start], array[rando_pivot] = array[rando_pivot], array[start]

    pivot = array[start]
    pivot_idx = start

    ((start + 1)...(start + length)).each do |i|
      if prc.call(pivot, array[i]) > 0 
        array[i], array[pivot_idx + 1] = array[pivot_idx + 1], array[i]
        pivot_idx += 1 
      end
    end

    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx


  end

  def select_kth_smallest(k)
    left = 0
    right = self.length - 1

    loop do 
      return self[left] if left == right
      pivot_idx = Array.partition(self, left, right - left + 1)

      if k - 1 == pivot_idx
        return self[k - 1]
      elsif k - 1 < pivot_idx
        right = pivot_idx - 1
      else
        left = pivot_idx + 1
      end 
    end

  end


  # def self.sort3(array, start, length = array.length, &prc, k)

  #   prc  ||= Proc.new{|x,y| x <=> y}

  #   pivot_idx = partition(array, start, length, &prc)

  #   if pivot_idx + 1 == k
  #     return array[pivot_idx]
  #   elsif pivot_idx + 1 > k 
  #     left_length = pivot_idx - start
  #     sort2!(array, start, left_length, &prc)
  #   else 
  #     right_length = length - (left_length + 1)
  #     sort2!(array, pivot_idx + 1, right_length, &prc)
  #   end 


  #   array 
  # end
end
