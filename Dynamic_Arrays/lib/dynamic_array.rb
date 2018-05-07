require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
   def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    empty?
    @store[@length]
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    empty?
    shift = @store[0]

    (@length - 1 ).times do |idx|
      @store[idx] = @store[idx + 1]
    end

    @length -= 1
    shift

  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity

    @length.downto(1) do |idx|
      @store[idx] = @store[idx - 1]
    end

    @length += 1
    @store[0] = val

  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  def empty?
    raise "index out of bounds" if @length == 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2

    temp_store = StaticArray.new(@capacity)

    @length.times do |idx|
      temp_store[idx] = @store[idx]
    end

    @store = temp_store

  end
end
