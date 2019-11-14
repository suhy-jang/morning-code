# @param {String} s
# @return {String[]}
require 'set'

class Solution
    attr_accessor :valid_expressions

    def initialize(length)
        @valid_expressions = Set.new
        @minimum_removed = length
    end
    
    def recurse(s, index, left_count, right_count, expression, removed_count)
        if index == s.length
            if left_count == right_count
                if removed_count <= @minimum_removed
                    possible_answer = expression
                    
                    if removed_count < @minimum_removed
                        @valid_expressions.clear()
                        @minimum_removed = removed_count
                    end
                    @valid_expressions.add(possible_answer)
                end
            end
        else
            current_character = s[index]
            length = expression.length
            if current_character != '(' && current_character != ')'
                expression.concat(current_character)
                recurse(s, index + 1, left_count, right_count, expression, removed_count)
                expression.slice!(length)
            else
                recurse(s, index + 1, left_count, right_count, expression, removed_count + 1)
                expression.concat(current_character)
                
                if current_character == '('
                    recurse(s, index + 1, left_count + 1, right_count, expression, removed_count)
                elsif right_count < left_count
                    recurse(s, index + 1, left_count, right_count + 1, expression, removed_count)
                end
                expression.slice!(length)
            end
        end
    end
end

def remove_invalid_parentheses(s)
    return [""] if s.length.zero?
    
    solution = Solution.new(s.length)
    solution.recurse(s, 0, 0, 0, "", 0)
    solution.valid_expressions.to_a
end
