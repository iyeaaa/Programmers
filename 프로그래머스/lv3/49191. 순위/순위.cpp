#include <vector>
#include <algorithm>
using namespace std;

int win[101][101], ans;

int solution(int n, vector<vector<int>> results) {
    for (auto v: results)
        win[v[0]][v[1]] = true;
            
    for (int k=1; k<=n; k++)
        for (int i=1; i<=n; i++)
            for (int j=1; j<=n; j++) if (!win[i][j])
                win[i][j] = win[i][k] && win[k][j];
                
    for (int i=1; i<=n; i++) {
        int cnt=0;
        for (int j=1; j<=n; j++)
            cnt += win[i][j] + win[j][i];
        if (cnt == n-1)
            ans++;
    }
            
    return ans;
}