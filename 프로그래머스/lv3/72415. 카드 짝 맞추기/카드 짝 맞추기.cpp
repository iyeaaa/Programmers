#include <string>
#include <vector>
#include <algorithm>
#include <queue>
#include <tuple>
using namespace std;
typedef vector<int> vi;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tiii;

const int INF = 99999999;
const int dy[] = {-1, 0, 1, 0};
const int dx[] = {0, -1, 0, 1};

int ans = INF;
vector<vi> g;
vector<int> cards;

bool OOB(int y, int x) {
    return y < 0 || y > 3 || x < 0 || x > 3;
}

tiii f(int sy, int sx, int key) {
    vector<vi> vst(4, vi(4, -1));
    queue<pii> q;
    
    q.push({sy, sx});
    vst[sy][sx] = 0;
    
    while (!q.empty()) {
        auto [y, x] = q.front(); q.pop();
        
        if (g[y][x] == key) {
            g[y][x] = 0;
            return {y, x, vst[y][x] + 1};
        }
        
        for (int i=0; i<4; i++) {
            int ny = y + dy[i];
            int nx = x + dx[i];
            
            if (OOB(ny, nx) || vst[ny][nx] != -1) 
                continue;
            
            q.push({ny, nx});
            vst[ny][nx] = vst[y][x] + 1;
        }
        
        for (int i=0; i<4; i++) {
            int ny = y + dy[i];
            int nx = x + dx[i];
            
            while (!OOB(ny, nx) && g[ny][nx] == 0)
                ny += dy[i], nx += dx[i];
            
            if (OOB(ny, nx))
                ny -= dy[i], nx -= dx[i];
            
            if (vst[ny][nx] != -1)
                continue;
            
            q.push({ny, nx});
            vst[ny][nx] = vst[y][x] + 1;
        }
    }
    
    return {-1, -1, -1};
}

void findCard() {
    int card[7] = {0,};
    
    for (int i=0; i<4; i++)
        for (int j=0; j<4; j++)
            card[g[i][j]] = true;
    
    for (int i=1; i<=6; i++)
        if (card[i])
            cards.push_back(i);
}

int solution(vector<vi> board, int r, int c) {
    g = board;
    
    findCard();
    
    sort(cards.begin(), cards.end());
    
    do {
        int cnt = 0;
        int sy = r, sx = c;
        g = board;
        
        for (auto card: cards) {
            for (int i=0; i<2; i++) {
                auto [ey, ex, tcnt] = f(sy, sx, card);
                cnt += tcnt;
                sy = ey;
                sx = ex;
            }
        }
        
        ans = min(ans, cnt);
        
    } while (next_permutation(cards.begin(), cards.end()));
    
    return ans;
}