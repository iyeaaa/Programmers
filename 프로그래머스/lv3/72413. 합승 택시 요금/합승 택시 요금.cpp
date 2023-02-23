#include <string>
#include <vector>
using namespace std;
typedef vector<int> vi;

const int MAX = 99999999;
int ans = MAX;
vector<vi> g(201, vi(201, MAX));

int solution(int n, int s, int a, int b, vector<vector<int>> fares) {
    for (const vi& v: fares) {
        g[v[0]][v[1]] = min(g[v[0]][v[1]], v[2]);
        g[v[1]][v[0]] = min(g[v[1]][v[0]], v[2]);
    }
    
    for (int i=1; i<=n; i++)
        g[i][i] = 0;
    
    for (int mid=1; mid<=n; mid++)
        for (int lo=1; lo<=n; lo++)
            for (int hi=1; hi<=n; hi++)
                g[lo][hi] = min(g[lo][hi], g[lo][mid] + g[mid][hi]);
    
    for (int i=1; i<=n; i++)
        ans = min(ans, g[s][i] + g[i][a] + g[i][b]);
    
    return ans;
}