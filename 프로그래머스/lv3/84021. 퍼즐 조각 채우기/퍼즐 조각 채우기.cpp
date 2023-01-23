#include <string>
#include <algorithm>
#include <vector>
using namespace std;
typedef vector<int> vi;
typedef pair<int, int> pii;

vector<vi> game_board, table;
vector<vector<pii>> p, b;
bool pV[51][51], bV[51][51];
int dy[] = {-1, 0, 1, 0}, dx[] = {0, -1, 0, 1};
int N, ans;

bool isRange(int y, int x) {
    return y>=0 && y<N && x>=0 && x<N;
}

void findB(int y, int x, int idx) {
    for (int i=0; i<4; i++) {
        int ny=y+dy[i], nx=x+dx[i];
        if (!isRange(ny, nx)) continue;
        if (game_board[ny][nx] != 0) continue;
        if (bV[ny][nx]) continue;
        bV[ny][nx] = true;
        b[idx].push_back({ny, nx});
        findB(ny, nx, idx);
    }
}

void findP(int y, int x, int idx) {
    for (int i=0; i<4; i++) {
        int ny=y+dy[i], nx=x+dx[i];
        if (!isRange(ny, nx)) continue;
        if (table[ny][nx]!=1) continue;
        if (pV[ny][nx]) continue;
        pV[ny][nx] = true;
        p[idx].push_back({ny, nx});
        findP(ny, nx, idx);
    }
}

pii minYX(const vector<pii>& v) {
    int mnY = 99999, mnX = 99999;
    for (auto [y, x]: v)
        mnY = min(mnY, y),
        mnX = min(mnX, x);
    return {mnY, mnX};
}

int height(const vector<pii>& v) {
    int mx = 99999;
    for (auto [y, x]: v)
        mx = max(mx, max(y,x));
    return mx;
}

void change(vector<pii>& v) {
    int h = height(v);
    for (auto& [y, x]: v) {
        int t = y;
        y = x;
        x = h-1 - t;
    }
    auto [minY, minX] = minYX(v);
    for (auto& [y, x]: v)
        y -= minY, x -= minX;
    sort(begin(v), end(v));
}

int solution(vector<vector<int>> tg, vector<vector<int>> tt) {
    game_board = tg, table = tt;
    N = tg.size();

    int idx = 0;
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            if (table[i][j] != 1) continue;
            if (pV[i][j]) continue;
            pV[i][j] = true;
            p.push_back({{i, j}});
            findP(i, j, idx);
            idx++;
        }
    }

    idx = 0;
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            if (game_board[i][j] != 0) continue;
            if (bV[i][j]) continue;
            bV[i][j] = true;
            b.push_back({{i, j}});
            findB(i, j, idx);
            idx++;
        }
    }

    for (auto v1: b) {
        change(v1);
        bool find = false;
        for (int i=0; i<p.size(); i++) {
            if (v1.size() != p[i].size()) continue;
            for (int j=0; j<4; j++) {
                change(p[i]);
                if (v1 == p[i]) {
                    ans += v1.size();
                    p.erase(p.begin()+i);
                    find = true;
                    break;
                }
            }
            if (find) break;
        }
    }

    return ans;
}
