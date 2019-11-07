class Solution {
public:
    int numSquares(int n) {
        vector<int> squares(n + 1);
        for(int i = 0; i < n+1; i++) {
            squares[i] = i * i;
        }
        vector<int> dp(n+1, INT_MAX);
        dp[0] = 0;
        int maxSquare = sqrt(n) + 1;
        for(int i = 1; i <= n; i++) {
            for(int s = 1; s < maxSquare; s++) {
                if (i - squares[s] < 0) break;
                dp[i] = min(dp[i], dp[i - squares[s]] + 1);
            }
        }
        return dp[n];
    }
};
