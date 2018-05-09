require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)

	sorted = []
	top = []

	vertices.each do |vertex|
		if vertex.in_edges.empty?
			top.unshift(vertex)
		end
	end

	until top.empty?
		current = top.pop
		sorted << current

		until current.out_edges.empty?
      current.out_edges.each do |edge|
        edge_to_vert = edge.to_vertex

        edge.destroy!

        if edge_to_vert.in_edges.empty?
          top.unshift(edge_to_vert)
        end
      end
    end
	end

	if sorted.length == vertices.length
    sorted
  else
    []
  end

end
