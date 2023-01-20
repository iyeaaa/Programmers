#include <vector>
#include <queue>
#include <algorithm>
using namespace std;
typedef pair<int,int> pii;

int v[105][105], dy[] = {-1,0,1,0}, dx[] = {0,-1,0,1};
vector<vector<int>> r;
queue<pii> q;

bool isIndependent(int x, int y) {
    bool rtn = false;
    for (int i=0; i<r.size(); i++) {
        int sx=2*r[i][0], sy=2*r[i][1], ex=2*r[i][2], ey=2*r[i][3];
        if (sx < x && x < ex && sy < y && y < ey)
            return false;
        if (sy <= y && y <= ey && (x==sx || x==ex) || sx<=x&&x<=ex && (y==sy||y==ey))
            rtn = true;
    }
    return rtn;
}
 
int solution(vector<vector<int>> R, int tcx, int tcy, int tix, int tiy) {
    r = R;
    int cx = 2*tcx, cy = 2*tcy, ix = 2*tix, iy = 2*tiy;
    
    fill(&v[0][0], &v[104][105], -1);
    q.push({cy, cx});
    v[cy][cx] = 0;
    
    while (!q.empty()) {
        auto [y, x] = q.front(); q.pop();
        if (y == iy && x == ix) return v[y][x]/2;
        for (int i=0; i<4; i++) {
            int ny = y+dy[i], nx = x+dx[i];
            if (!isIndependent(nx,ny) || v[ny][nx] != -1) continue;
            q.push({ny, nx});
            v[ny][nx] = v[y][x] + 1;
        }
    }
    
    return -1;
}