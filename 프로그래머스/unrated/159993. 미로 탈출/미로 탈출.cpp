#include <string>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

int dy[] = {-1, 0, 1, 0}, dx[] = {0, -1, 0, 1};
int n, m;
int INF = 99999999;
int v[101][101];

bool isRange(int y, int x) {
    return y >= 0 && y < n && x >= 0 && x < m;
}

int dist(int sy, int sx, char e, const vector<string>& maps) {
    queue<pair<int,int>> q;
    q.push({sy, sx});
    fill(&v[0][0], &v[100][101], INF);
    v[sy][sx] = 0;
    
    while (!q.empty()) {
        auto [y, x] = q.front(); q.pop();
        if (maps[y][x] == e)
            return v[y][x];
        for (int i=0; i<4; i++) {
            int ny = y+dy[i];
            int nx = x+dx[i];
            if (!isRange(ny, nx)) continue;
            if (maps[ny][nx] == 'X') continue;
            if (v[ny][nx] != INF) continue;
            q.push({ny, nx});
            v[ny][nx] = v[y][x] + 1;
        }
    }
    
    return INF;
}

int solution(vector<string> maps) {
    n = maps.size();
    m = maps.front().size();
    int sy, sx, ly, lx;
    
    for (int i=0; i<n; i++)
        for (int j=0; j<m; j++)
            if (maps[i][j] == 'S')
                sy = i, sx = j;
            else if (maps[i][j] == 'L')
                ly = i, lx = j;
    
    int ans = dist(sy, sx, 'L', maps) + dist(ly, lx, 'E', maps);
    
    return ans > INF ? -1 : ans;
}