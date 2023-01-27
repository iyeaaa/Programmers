#include <string>
#include <vector>
#include <algorithm>
using namespace std;
typedef pair<int, int> pii;

vector<int> ans;
vector<string> maps;
int dy[] = {-1, 0, 1, 0}, dx[] = {0, -1, 0, 1};
int n, m, v[101][101];

bool isRange(int y, int x) {
    return y>=0 && y<n && x>=0 && x<m;
}

int f(int y, int x) {
    int sum = maps[y][x] - '0';
    for (int i=0; i<4; i++) {
        int ny = y+dy[i], nx = x+dx[i];
        if (!isRange(ny, nx)) continue;
        if (maps[ny][nx] == 'X') continue;
        if (v[ny][nx] != -1) continue;
        v[ny][nx] = true;
        sum += f(ny, nx);
    }
    return sum;
}

vector<int> solution(vector<string> tmaps) {
    maps = tmaps;
    n = maps.size(), m = maps[0].size();
    fill(&v[0][0], &v[100][101], -1);
    
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            if (maps[i][j] == 'X') continue;
            if (v[i][j] != -1) continue;
            v[i][j] = true;
            ans.push_back(f(i, j));
        }
    }
    
    sort(ans.begin(), ans.end());
    
    if (ans.empty())
        ans.push_back(-1);
    
    return ans;
}