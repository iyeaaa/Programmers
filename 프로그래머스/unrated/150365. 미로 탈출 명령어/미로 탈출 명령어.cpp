#include <string>
#include <vector>
using namespace std;

int n, m, r, c, k;
int dx[] = {1, 0, 0, -1}, dy[] = {0, -1, 1, 0};
string ds = "dlru", s;

bool isPsb(int x, int y) {
    return x > 0 && x <= n && y > 0 && y <= m && k >= abs(x-r) + abs(y-c);
}

string solution(int tn, int tm, int x, int y, int tr, int tc, int tk) {
    n = tn, m = tm, r = tr, c = tc, k = tk;
    
    while (k--) {
        bool isGo = false;
        for (int i=0; i<4; i++) {
            int nx = x+dx[i], ny = y+dy[i];
            if (!isPsb(nx, ny)) continue;
            x = nx, y = ny, s += ds[i];
            isGo = true;
            break;
        }
        if (!isGo && k == 0)
            return "impossible";
    }
    
    return s;
}