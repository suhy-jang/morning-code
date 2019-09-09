# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
    anagrams = Hash.new
    strs.each do |str|
        word = str.chars.sort.join
        if anagrams[word]
            anagrams[word] << str 
        else
            anagrams[word] = [str]
        end
    end
    anagrams.values
end
