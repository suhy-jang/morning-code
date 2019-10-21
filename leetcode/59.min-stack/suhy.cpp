class MinStack {
public:
    /** initialize your data structure here. */
    
    MinStack() {
        
    }
    
    void push(int x) {
        arr.push_back(x);
        if (minHash.find(x) != minHash.end()) {
            minHash[x] += 1;
        } else {
            minHash[x] = 1;
        }
    }
    
    void pop() {
        int top = arr.back();
        arr.pop_back();
        
        if (minHash.find(top) != minHash.end()) {
            minHash[top] -= 1;
        }
        if (minHash[top] == 0) {
            minHash.erase(top);
        }
    }
    
    int top() {
        return arr.back();
    }
    
    int getMin() {
        map<int, int>::iterator itr = minHash.begin();
        return itr->first;
    }
private: 
    vector<int> arr;
    map<int, int> minHash;
};

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack* obj = new MinStack();
 * obj->push(x);
 * obj->pop();
 * int param_3 = obj->top();
 * int param_4 = obj->getMin();
 */
