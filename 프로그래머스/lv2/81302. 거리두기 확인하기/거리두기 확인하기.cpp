#include <bits/stdc++.h>
using namespace std;

vector<int> ans;

bool safe(int y1, int x1, const vector<string>& g) {
    queue<pair<int, int>> q;
    int vst[5][5];
    
    fill(&vst[0][0], &vst[4][5], -1);
    q.push({y1, x1});
    vst[y1][x1] = 0;
    
    while (!q.empty()) {
        auto [y, x] = q.front(); q.pop();
        if ((y != y1 || x != x1) && vst[y][x] <= 2 && g[y][x] == 'P') return false;
        if (vst[y][x] > 2) return true;
        for (int i=0; i<4; i++) {
            int ny = y + "2101"[i] - '1';
            int nx = x + "1012"[i] - '1';
            if (ny < 0 || ny >= 5 || nx < 0 || nx >= 5) continue;
            if (vst[ny][nx] != -1) continue;
            if (g[ny][nx] == 'X') continue;
            q.push({ny, nx});
            vst[ny][nx] = vst[y][x] + 1;
        }
    }
    
    return true;
}

vector<int> solution(vector<vector<string>> places) {
    for (const auto& g: places) {
        bool issafe = true;
        for (int i=0; i<5; i++) for (int j=0; j<5; j++) if (g[i][j] == 'P') {
            if (!safe(i, j, g)) 
                issafe = false;
        }
        ans.push_back(issafe); 
    }
    return ans;
}