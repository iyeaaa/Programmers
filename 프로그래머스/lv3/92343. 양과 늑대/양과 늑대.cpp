#include <string>
#include <vector>
#include <queue>
#include <tuple>
using namespace std;
typedef pair<int, int> pi;

int result;
vector<int> tree[18];
bool v[18][1<<17];
queue<pi> q;

pi findCnt(int info, const vector<int>& isWolf) {
    int sheep = 0;
    int wolf = 0;
    string bn;
    
    while (info > 0)
        bn += info%2, info/=2;
            
    for (int i=bn.size()-1; i>=0; i--)
        if (isWolf[i]) wolf += bn[i];
        else sheep += bn[i];
    
    return {sheep, wolf};
}

int solution(vector<int> isWolf, vector<vector<int>> edges) {
    for (const vector<int>& v: edges)
        tree[v[0]].push_back(v[1]),
        tree[v[1]].push_back(v[0]);
    
    v[0][1] = true;
    q.push({0, 1});
    
    while (!q.empty()) {
        auto [cur, info] = q.front(); q.pop();
        auto [sheep, wolf] = findCnt(info, isWolf);
        result = max(result, sheep);
        
        for (int nxt: tree[cur]) {
            int nxtInfo = info | (1 << nxt);
            int nxtSheep = sheep + (!isWolf[nxt] && !(info & (1<<nxt)));
            int nxtWolf = wolf + (isWolf[nxt] && !(info & (1<<nxt)));
            
            
            if (v[nxt][nxtInfo]) continue;
            if (nxtSheep <= nxtWolf) continue;
            
            q.push({nxt, nxtInfo});
            v[nxt][nxtInfo] = true;
        }
    }
    
    return result;
}