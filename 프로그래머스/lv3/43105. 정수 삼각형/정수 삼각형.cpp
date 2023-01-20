#include <string>
#include <vector>

using namespace std;

int dp[501][501];
vector<vector<int>> t;

int f(int y, int x) {
    if (y == t.size()-1) return t[y][x];
    if (dp[y][x] != -1) return dp[y][x];
    return dp[y][x] = max(f(y+1, x), f(y+1, x+1)) + t[y][x];
}

int solution(vector<vector<int>> tr) {
    for (int i=0; i<tr.size()-1; i++)
        for (int j=0; j<i+1; j++)
            dp[i][j] = -1;
    t = tr;
    return f(0, 0);
}