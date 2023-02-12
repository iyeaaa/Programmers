#include <string>
#include <vector>
using namespace std;
typedef vector<int> vi;

int dy[] = {0, -1, 0, 1, 0};
int dx[] = {0, 0, -1, 0, 1};

vector<vi> g;
int n;
int ans = 99999999;

bool isRange(int y, int x) {
    return y >= 0 && y < n && x >= 0 && x < n;
}

int findCnt(int cnt, vector<vi> graph) {
    for (int i=1; i<n; i++) {
        for (int j=0; j<n; j++) {
            while (graph[i-1][j] != 0) {
                cnt++;
                for (int k=0; k<5; k++) {
                    int ni = i+dy[k];
                    int nj = j+dx[k];
                    
                    if (!isRange(ni, nj))
                        continue;
                    
                    graph[ni][nj] = (graph[ni][nj] + 1) % 4;
                }
            }
        }
    }
    
    for (int i=0; i<n; i++)
        for (int j=0; j<n; j++)
            if (graph[i][j] != 0)
                return 99999999;
    
    return cnt;
}

void dfs(int idx, int cnt) {
    if (idx == n) {
        ans = min(ans, findCnt(cnt, g));
        return;
    }
    for (int i=0; i<4; i++) {
        dfs(idx+1, cnt+i);
        for (int dir=0; dir<5; dir++) {
            int ni =  0  + dy[dir];
            int nj = idx + dx[dir];
            
            if (!isRange(ni, nj))
                continue;
            
            g[ni][nj] = (g[ni][nj] + 1) % 4;
        }
    }
}

int solution(vector<vi> clockHands) {
    g = clockHands;
    n = g.size();
    
    dfs(0, 0);
    return ans;
}