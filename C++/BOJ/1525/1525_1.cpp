/**
* 메모리: 16556 KB, 시간: 244 ms
* 2022.08.12
* by Alub
*/
#include <iostream>
#include <string>
#include <queue>
#include <set>

using namespace std;

string END = "123456780";
set<string> ovrp;
string start;

void input() {
    for(int i = 1; i <= 3; i++)
        for(int j = 1; j <= 3; j++) {
            char x; cin >> x;
            start += x;
        }
}

void bfs() {
    queue<pair<string, int>> q;
    q.push({start, 0});
    int dy[] = {-1, 0, 1, 0};
    int dx[] = {0, 1, 0, -1};

    while (!q.empty()) {
        auto [cur, cnt] = q.front(); q.pop();
        if(cur == END) { cout << cnt; return; }
        int zeroIdx = cur.find('0');
        int y = zeroIdx/3, x = zeroIdx%3;
        for(int i = 0; i < 4; i++) {
            int ny = y+dy[i], nx = x+dx[i];
            if(ny < 0 || ny >= 3 || nx < 0 || nx >= 3) continue;
            string next = cur;
            swap(next[zeroIdx], next[ny*3+nx]);
            if(ovrp.contains(next)) continue;
            q.push({next, cnt+1});
            ovrp.insert(next);
        }
    }
    cout << -1;
    return;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input();
    bfs();
}