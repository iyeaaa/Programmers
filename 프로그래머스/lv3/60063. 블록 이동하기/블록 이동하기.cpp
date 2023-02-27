#include <string>
#include <vector>
#include <tuple>
#include <queue>
#include <algorithm>
using namespace std;
typedef vector<int> vi;
typedef tuple<int, int, int> tii;

const int dy[] = {-1, 0, 1, 0};
const int dx[] = {0, -1, 0, 1};
const int rdy[] = {-1, -1, 0, 0, -1, -1, 1, 1};
const int rdx[] = {0, 1, 0, 1, 1, 0, 1, 0};
const int cdy[] = {0, 1, 0, 1, 1, 0, 1, 0};
const int cdx[] = {-1, -1, 0, 0, -1, -1, 1, 1};

int n;
vector<vi> g;

bool isGood(int y, int x) {
    return y>=0 && y<n && x>=0 && x<n && g[y][x] == 0;
}

int f() {
    queue<tii> q;
    int vst[n+1][n+1][2];
    
    fill(&vst[0][0][0], &vst[n][n][2], -1);
    q.push({0, 0, 0});
    vst[0][0][0] = 0;
    
    while (!q.empty()) {
        auto [y, x, d] = q.front(); q.pop();
        
        // 기저 조건
        if (d == 0) {
            if (y == n-1 && x == n-1 || y == n-1 && x+1 == n-1)
                return vst[y][x][d];
        } 
        else {
            if (y == n-1 && x == n-1 || y+1 == n-1 && x == n-1)
                return vst[y][x][d];
        }
        
        // 한칸씩 이동
        for (int i=0; i<4; i++) {
            int ny = y + dy[i];
            int nx = x + dx[i];
            
            if (!isGood(ny, nx)) continue;
            if (vst[ny][nx][d] != -1) continue;
            if (d == 0 && !isGood(ny, nx+1)) continue;
            if (d == 1 && !isGood(ny+1, nx)) continue;
            
            q.push({ny, nx, d});
            vst[ny][nx][d] = vst[y][x][d] + 1;
        }
        
        // 회전
        if (d == 0) {
            for (int i=0; i<4; i++) {
                int ny = y + rdy[i];
                int nx = x + rdx[i];
                
                if (!isGood(ny, nx)) continue;
                if (!isGood(ny+1, nx)) continue;
                if (!isGood(y+rdy[i+4], x+rdx[i+4])) continue;
                if (vst[ny][nx][1] != -1) continue;
                
                q.push({ny, nx, 1});
                vst[ny][nx][1] = vst[y][x][d] + 1;
            }
        }
        else {
            for (int i=0; i<4; i++) {
                int ny = y + cdy[i];
                int nx = x + cdx[i];
                
                if (!isGood(ny, nx)) continue;
                if (!isGood(ny, nx+1)) continue;
                if (!isGood(y+cdy[i+4], x+cdx[i+4])) continue;
                if (vst[ny][nx][0] != -1) continue;
                
                q.push({ny, nx, 0});
                vst[ny][nx][0] = vst[y][x][d] + 1;
            }
        }
    }
    
    return -1;
}

int solution(vector<vi> board) {
    g = board;
    n = g.size();
    
    return f();
}