#include <string>
#include <vector>
#include <algorithm>
#define All(x) (x).begin, (x).end
using namespace std;
typedef vector<int> vi;

vi sales;
vi tree[300'001];
long long dp[300001][2];
long long INF = 0x7fffffff7fffffff;
int n;

void f(int cur) {
    if (tree[cur].empty()) {
        dp[cur][0] = 0;
        dp[cur][1] = sales[cur];
        return;
    }
    
    int take = 0;
    long long mindiff = INF;
    
    for (int nxt: tree[cur]) {
        f(nxt);
        take += min(dp[nxt][0], dp[nxt][1]);
        mindiff = min(mindiff, dp[nxt][1] - dp[nxt][0]);
    }
    
    dp[cur][0] = take + max(0ll, mindiff);
    dp[cur][1] = take + sales[cur];
    
    return;
}

int solution(vector<int> ts, vector<vector<int>> links) {
    sales = ts;
    n = sales.size();
    fill(&dp[0][0], &dp[n][2], -1);
    sales.insert(sales.begin(), 0);
    
    for (const auto& link: links)
        tree[link[0]].push_back(link[1]);
    
    f(1);
    
    return min(dp[1][0], dp[1][1]);
}