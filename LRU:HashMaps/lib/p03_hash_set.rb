require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    p @store
    resize! if @count == num_buckets
    @store[ key.hash % num_buckets] << key unless include?(key)
    @count += 1
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    @store[key.hash % num_buckets].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = Array.new(count * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |el|
        temp_store[el.hash % temp_store.length ] << el
      end
    end

    @store = temp_store

  end
end
