#include<vector>
#include<queue>
#include<algorithm>
using namespace std;
typedef pair<int,int> pii;

int dy[] = {-1,0,1,0}, dx[] = {0,-1,0,1};
int v[101][101], n, m;
queue<pii> q;

int solution(vector<vector<int> > maps) {
    fill(&v[0][0], &v[100][101], -1);
    n = maps.size(); m = maps[0].size();
    q.push({0, 0});
    v[0][0] = 1;
    
    while (!q.empty()) {
        auto [y, x] = q.front(); q.pop();
        if (y == n-1 && x == m-1) return v[y][x];
        for (int i=0; i<4; i++) {
            int ny = y+dy[i], nx = x+dx[i];
            if (ny<0 || ny>=n || nx<0 || nx>=m) continue;
            if (maps[ny][nx] == 0) continue;
            if (v[ny][nx] != -1) continue;
            q.push({ny, nx});
            v[ny][nx] = v[y][x] + 1;
        }
    }
    
    return -1;
}