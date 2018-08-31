require_relative 'heap'

def k_largest_elements(array, k)
    array.heap_sort!.drop(array.length - k)
end
