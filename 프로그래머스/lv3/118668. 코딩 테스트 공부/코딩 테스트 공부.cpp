#include <vector>
#include <algorithm>
using namespace std;
typedef vector<int> vi;

const int INF = 987654321;
vector<vi> dp(600, vi(600, INF));

int solution(int alp, int cop, vector<vi> p) {
    dp[alp][cop] = 0;
    int mxAlp = alp;
    int mxCop = cop;
    
    for (const vector<int>& v: p)
        mxAlp = max(mxAlp, v[0]),
        mxCop = max(mxCop, v[1]);
    
    p.push_back({-1, -1, 1, 0, 1});
    p.push_back({-1, -1, 0, 1, 1});
    
    for (int i=alp; i<=mxAlp; i++) {
        for (int j=cop; j<=mxCop; j++) {
            for (vector<int>& v: p) {
                int alp_req = v[0];
                int cop_req = v[1];
                int alp_rwd = v[2];
                int cop_rwd = v[3];
                int cost = v[4];
                
                if (i < alp_req || j < cop_req) continue;
                
                int na = min(mxAlp, i+alp_rwd);
                int nc = min(mxCop, j+cop_rwd);
                
                dp[na][nc] = min(dp[i][j] + cost, dp[na][nc]);
            }
        }
    }
    
    return dp[mxAlp][mxCop];
}