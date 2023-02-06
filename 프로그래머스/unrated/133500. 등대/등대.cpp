#include <string>
#include <vector>
#include <cstring>
using namespace std;

vector<int> g[100'101];
int dp[100'001][2];
bool v[100'001];

int f(int cur, bool check) {
    if (v[cur])
        return 0;
    
    if (dp[cur][check] != -1) 
        return dp[cur][check];
    
    v[cur] = true;
    
    int sum = check;
    for (auto& nxt: g[cur])
        sum += !check ? f(nxt, true) : min(f(nxt, false), f(nxt, true));
    
    v[cur] = false;
    
    return dp[cur][check] = sum;
}

int solution(int n, vector<vector<int>> lighthouse) {
    for (auto& v: lighthouse)
        g[v[0]].push_back(v[1]),
        g[v[1]].push_back(v[0]);
    
    memset(dp, -1, sizeof dp);
    
    return min(f(1, false), f(1, true));
}