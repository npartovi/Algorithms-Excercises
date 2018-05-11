class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2} 
    @frog_cache = { 1 => [[1]], 2 =>  [[1,1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
  end

  def blair_nums(n)
    blair_builder(n)
    @blair_cache[n] 
  end

  def blair_builder(n) 
    return @blair_cache[n] if @blair_cache[n]
    next_blair = blair_builder(n-1) + blair_builder(n-2) + 2*(n-1) - 1
    @blair_cache[n] = next_blair 
    return next_blair 
  end 

  def frog_hops_bottom_up(n)
    local_cache = frog_cache_builder(n) 
    local_cache[n] 
  end

  def frog_cache_builder(n)
    frog_cache = { 1 => [[1]], 2 =>  [[1,1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
    return frog_cache if n <= 3 

    (4..n).each do |n|
      frog_hops1 = frog_cache[n-1].map { |arr| arr + [1] }
      frog_hops2 = frog_cache[n-2].map { |arr| arr + [2] }
      frog_hops3 = frog_cache[n-3].map { |arr| arr + [3] }
      frog_cache[n] = frog_hops1 + frog_hops2 + frog_hops3
    end
    frog_cache 
  end 

  def frog_hops_top_down(n)
    return @frog_cache[n] if @frog_cache[n] 
    next_frog = frog_hops_top_down_helper(n) 
    @frog_cache[n] = next_frog 
    return next_frog 
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n] 
    fh1 = frog_hops_top_down_helper(n - 1).map { |arr| arr + [1]} 
    fh2 = frog_hops_top_down_helper(n - 2).map { |arr| arr + [2]} 
    fh3 = frog_hops_top_down_helper(n - 3).map { |arr| arr + [3]}
    @frog_cache[n] = fh1 + fh2 + fh3 
    @frog_cache[n] 
  end

  def super_frog_hops(n, k)
    super_frog_cache = super_frog_cache_builder(n, k)
    super_frog_cache[k][n]
  end

  def super_frog_cache_builder(n, k)
    cache = {}
    (1..n).each do |col|
      (1..k).each do |row|
        cache[row] = [[[]]] unless cache[row]
        result = []
        if row == 1
          result << cache[row][col - 1][0] + [1]
        elsif row == col
          result = cache[row - 1][col].dup
          result << [row]
        elsif col > row
          (1...col).each do |column|
            cache[row][column].each do |hop|
              next if (col - column) > k
              result << hop + [col - column]
            end
          end
        elsif row > col
          result = cache[col][col]
        end
        cache[row][col] = result
      end
    end
    cache
  end

   def knapsack(weights, values, capacity)
    knapsack_cache = knapsack_table(weights, values, capacity)
    knapsack_cache[capacity].last
  end

  # Helper method for bottom-up implementation

  def knapsack_table(weights, values, capacity)
    knapsack_cache = {0 => Array.new(weights.length, 0)}
    (1..capacity).each do |c|
      knapsack_cache[c] = c == weights[0] ? [values[0]] : [0]
    end
    (1...weights.length).each do |col|
      (1..capacity).each do |c|
        current_weight = weights[col]
        current_value = values[col]
        if c < current_weight
          knapsack_cache[c][col] = knapsack_cache[c][col - 1]
        else
          new_value = knapsack_cache[c - current_weight][col - 1] + current_value
          knapsack_cache[c][col] = [new_value, knapsack_cache[c][col - 1]].max
        end
      end
    end
    knapsack_cache

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end