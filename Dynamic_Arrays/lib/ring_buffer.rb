require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
    @start_index = 0
  end

  # O(1)
  def [](index)

    check_index(index)
    @store[actual_index(index)]
  end

  # O(1)
  def []=(index, val)

    check_index(index)
    @store[actual_index(index)] = val
    @length += 1
  end

  # O(1)
  def pop

    empty?
    last_el = @store[actual_index(@length - 1)]
    @length -= 1
    last_el
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[actual_index(@length)] = val
    @length += 1
  end

  # O(1)
  def shift
    empty?
    shift = @store[@start_index]
    @start_index += 1
    @length -= 1
    shift
  end

  # O(1) ammortized
  def unshift(val)

    resize! if @length == @capacity
    @length += 1
    @start_index -= 1
    @store[@start_index] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def actual_index(index)

    (index + @start_index ) % capacity 

  end

  def empty?
    raise "index out of bounds" if @length == 0 
  end

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  def resize!
    @capacity *= 2

    temp_store = StaticArray.new(@capacity)

    @length.times do |idx|
      temp_store[idx] = @store[idx]
    end

    @start_index = 0
    @store = temp_store
  end
end
