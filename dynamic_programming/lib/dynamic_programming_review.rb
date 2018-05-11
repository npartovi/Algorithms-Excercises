class DynamicProgramming

  attr_accessor :maze_cache

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frogs_cache = []
    @maze_cache = {}
  end

  def blair_nums(n)
    return nil if n <= 0
    return @blair_cache[n] unless @blair_cache[n].nil?

    odd = (2 * n) - 3
    ans = blair_nums(n - 2) + blair_nums(n - 1) + odd
    
    @blair_cache[n] = ans
    ans
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]

  end

  def frog_cache_builder(n)
    ways = [[[]],[[1]], [[1,1],[2]]]

    return ways if n < 3

    (3..n).each do |i|
      new_way_set = []
      (1..3).each do |first_step|
        ways[i - first_step].each do |way|
          new_way = [first_step]
          way.each do |step|
            new_way << step
          end
          new_way_set << new_way
        end
      end
      ways << new_way_set
    end
    ways
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)[n]

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)
    return nil if capacity <= 0 || weights.length == 0

    solution_table = knapsack_table(weights, values, capacity)
    solution_table[capacity][-1]

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    solution_table = []

    (0..capacity).each do |i|
      solution_table[i] = []

      (0...weights.length).each do |j|
        if i == 0
          solution_table[i][j] = 0
        elsif j == 0
          solution_table[i][j] = weights[0] > i ? 0 : values.first
        else
          option1 = solution_table[i][j - 1]
          option2 = i < weights[j] ? 0 : solution_table[i - weights[j]][j - 1] + values[j]
          optimum = [option1, option2].max
          solution_table[i][j] = optimum
        end
      end
    end

    solution_table
  end

  def maze_solver(maze, start_pos, end_pos)
    @maze_cache[start_pos] = nil
    queue = [start_pos]

    until queue.empty?
      current = queue.pop
      break if current == end_pos

      get_moves(maze, current).each do |move|
        @maze_cache[move] = current
        queue << move
      end
    end

    @maze_cache.include?(end_pos) ? path_from_cache(end_pos) : nil
  end

  def get_moves(maze, pos)
    x,y = pos
    moves = []
    directions = [[1,0],[-1,0],[0,1],[0,-1]]

    directions.each do |new_x, new_y|
      next_pos = [x + new_x, y + new_y]

      if is_valid_pos?(maze, next_pos)
        moves << next_pos unless @maze_cache.include?(next_pos)
      end
    end
    moves
  end

  def is_valid_pos?(maze, pos)
    x, y = pos
    x >= 0 && y >= 0 && x < maze.length && y < maze.first.length && maze[x][y] != "X"
  end

  def path_from_cache(end_pos)
    path = []
    current = end_pos

    while current
      path.unshift(current)
      current = @maze_cache[current]
    end
  end
end
