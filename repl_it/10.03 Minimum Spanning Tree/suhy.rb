# https://www.youtube.com/watch?v=s19y3XCAzAg

require 'set'

def minimum_spanning_tree(matrix)
  spans = Array.new
  lists = (0...matrix.size).each_with_object(Array.new) { |i, arr| arr << i }
  relations = Hash.new( Hash.new )
  infinite = get_set(matrix).max + 1
  (0...matrix.size).each { |i| relations[i] = { span: infinite, parent: nil } }
  relations[0][:span] = 0
  until lists.empty?
    u = smallest_span(relations, lists)
    lists.delete u
    spans << relations[u][:span] if parent = relations[u][:parent]
    matrix[u].each_with_index do |span, adj|
      next if span.zero?
      if lists.include?(adj) && span < relations[adj][:span]
        relations[adj][:span] = span
        relations[adj][:parent] = u
      end
    end
  end
  return spans
end

def smallest_span(relations, candis)
  return nil if candis.empty? || relations.empty?
  min = Hash.new
  min = { span: relations[candis.first][:span], index: candis.first }
  candis.each do |candi|
    if !relations[candi][:span].zero? && min[:span] > relations[candi][:span]
      min[:span] = relations[candi][:span]
      min[:index] = candi
    end
  end
  min[:index]
end

def get_set(two_d)
  two_d.each_with_object(Set.new) do |linear, set|
    linear.each do |e|
      set << e
    end
  end
end

p minimum_spanning_tree([
  [0, 4, 1, 4, 0, 0, 0, 0, 0, 0], [4, 0, 5, 0, 9, 9, 0, 7, 0, 0], [1, 5, 0, 3, 0, 0, 0, 9, 0, 0],
  [4, 0, 3, 0, 0, 0, 0, 10, 0, 18], [0, 9, 0, 0, 0, 2, 4, 0, 6, 0], [0, 9, 0, 0, 2, 0, 2, 8, 0, 0],
  [0, 0, 0, 0, 4, 2, 0, 9, 3, 9], [0, 7, 9, 10, 0, 8, 9, 0, 0, 8], [0, 0, 0, 0, 6, 0, 3, 0, 0, 9],
  [0, 0, 0, 18, 0, 0, 9, 8, 9, 0]
  ])
# => [1, 3, 4, 7, 8, 2, 2, 3, 8]

