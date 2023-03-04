#include <bits/stdc++.h>
using namespace std;

int u = 99999, d = -1, l = 99999, r = -1;
int n, m;

vector<int> solution(vector<string> wallpaper) {
    n = wallpaper.size();
    m = wallpaper.front().size();
    for (int i=0; i<n; i++) for (int j=0; j<m; j++) if (wallpaper[i][j] == '#') {
        u = min(u, i), d = max(d, i), l = min(l, j), r = max(r, j);
    }
    
    return {u, l, d+1, r+1};
}