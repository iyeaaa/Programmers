#include <string>
#include <vector>
#include <queue>
using namespace std;

vector<int> g[100'101];
vector<int> result;
vector<int> v(100'001, -1);

void f(int s, int n) {
    v[s] = 0;
    
    queue<int> q;
    q.push(s);
    
    while (!q.empty()) {
        int cur = q.front(); q.pop();
        for (auto& nxt: g[cur]) if (v[nxt] == -1) {
            q.push(nxt);
            v[nxt] = v[cur] + 1;
        }
    }
}

vector<int> solution(int n, vector<vector<int>> roads, vector<int> sources, int destination) {
    for (auto& v: roads)
        g[v[0]].push_back(v[1]),
        g[v[1]].push_back(v[0]);
    
    f(destination, n);
    
    for (auto& e: sources)
        result.push_back(v[e]);
    
    return result;
}