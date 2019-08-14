# @param {Integer[]} height
# @return {Integer}
def max_area(heights)
    start = 0
    finish = heights.size-1
    max_area = nil
    while start < finish
        area = (finish-start)*[heights[start],heights[finish]].min
        if max_area.nil?
            max_area = area
        else
            max_area = [max_area, area].max
        end
        if heights[start] > heights[finish]
            finish -= 1
        else
            start += 1
        end
    end
    max_area
end

# input : [1,8,6,2,5,4,8,3,7]
# output : 49

# input : [1,2,4,3]
# output : 4
