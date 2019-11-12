# @param {Integer[][]} people
# @return {Integer[][]}
def reconstruct_queue(people)
    people.sort! { |a, b| a[0] == b[0] ? a[1] - b[1] : b[0] - a[0] }
    result = []
    people.each do |p|
        result.insert(p[1], p)
    end
    result
end  

