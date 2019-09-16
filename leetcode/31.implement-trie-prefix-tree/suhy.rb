class Trie
    attr_accessor :root

=begin
    Initialize your data structure here.
=end
    def initialize()
        @root = Node.new
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        curr = @root
        word.each_char do |c|
            curr.values[c] = Node.new unless curr.values[c]
            curr = curr.values[c]
        end
        curr.ending = true
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        curr = starts_with(word, true)
        curr.is_a?(Node) && curr.ending
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix, return_with_node = false)
        curr = @root
        prefix.each_char do |c|
            return false unless curr.values[c]
            curr = curr.values[c]
        end
        
        return_with_node ? curr : true
    end


end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)

class Node
    attr_accessor :values, :ending
    
    def initialize
        @values = {}
        @ending = false
    end
end
