#include <vector>
#include <algorithm>
using namespace std;

int win[101][101], ans, INF = 99999999;

int solution(int n, vector<vector<int>> results) {
    fill(&win[0][0], &win[100][100], INF);
    
    for (auto v: results)
        win[v[0]][v[1]] = 1;
            
    for (int k=1; k<=n; k++)
        for (int i=1; i<=n; i++)
            for (int j=1; j<=n; j++)
                win[i][j] = min(win[i][j], win[i][k]+win[k][j]);
                
    for (int i=1; i<=n; i++) {
        int cnt=0;
        for (int j=1; j<=n; j++) if (i!=j)
            if (win[i][j]!=INF || win[j][i]!=INF)
                cnt++;
        if (cnt == n-1)
            ans++;
    }
            
    return ans;
}