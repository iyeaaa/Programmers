#include <string>
#include <vector>
#include <algorithm>
#define All(x) (x).begin, (x).end
using namespace std;
typedef vector<int> vi;

vi sales;
vi tree[300'001];
int dp[300001][2];
int n;

int f(int cur, bool attend) {
    if (tree[cur].empty())
        return attend ? sales[cur] : 0;
    
    if (dp[cur][attend] != -1)
        return dp[cur][attend];
    
    int take;
    
    if (attend) {
        take = sales[cur];
        for (int nxt: tree[cur])
            take += min(f(nxt, false), f(nxt, true));
    } else {
        take = 0;
        bool allAbsence = true;
        int mnDiff = 99999999;
        for (int nxt: tree[cur]) {
            if (f(nxt, false) > f(nxt, true))
                allAbsence = false;
            take += min(f(nxt, false), f(nxt, true));
            mnDiff = min(mnDiff, f(nxt, true) - f(nxt, false));
        }
        if (allAbsence)
            take += mnDiff;
    }
    
    return dp[cur][attend] = take;
}

int solution(vector<int> ts, vector<vector<int>> links) {
    sales = ts;
    n = sales.size();
    fill(&dp[0][0], &dp[n][2], -1);
    sales.insert(sales.begin(), 0);
    
    for (const auto& link: links)
        tree[link[0]].push_back(link[1]);
    
    return min(f(1, false), f(1, true));
}