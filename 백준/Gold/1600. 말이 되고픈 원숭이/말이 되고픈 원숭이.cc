
#include <iostream>
#include <queue>
#include <tuple>

using namespace std;

const int walk_dy[4] = {-1, 1, 0, 0};
const int walk_dx[4] = {0, 0, 1, -1};
const int jump_dy[8] = {-1, -1, -2, -2, 1, 1, 2, 2};
const int jump_dx[8] = {-2, 2, 1, -1, -2, 2, 1, -1};

int main() {
    int K, W, H;
    int graph[201][201];
    int jumpCnt[201][201];
    cin >> K >> W >> H;

    for(int i = 0; i < H; i++) {
        for (int j = 0; j < W; j++) {
            cin >> graph[i][j];
            jumpCnt[i][j] = -1;
        }
    }

    jumpCnt[0][0] = K;
    queue<tuple<int, int, int>> q;
    q.push(make_tuple(0, 0, 0));
    int result = -1;

    while (!q.empty()) {
        auto [y, x, cnt] = q.front();
        q.pop();
        if(y == H-1 && x == W-1) { result = cnt; break; }
        for(int i = 0; i < 4; i++) {
            int ny = y+walk_dy[i], nx = x+walk_dx[i];
            if (ny < 0 || ny >= H || nx < 0 || nx >= W) { continue; }
            if (graph[ny][nx] == 1) { continue; }
            if (jumpCnt[ny][nx] >= jumpCnt[y][x]) { continue; }
            q.push(make_tuple(ny, nx, cnt + 1));
            jumpCnt[ny][nx] = jumpCnt[y][x];
        }
        if(jumpCnt[y][x] <= 0) { continue; }
        for(int i = 0; i < 8; i++) {
            int ny = y+jump_dy[i], nx = x+jump_dx[i];
            if (ny < 0 || ny >= H || nx < 0 || nx >= W) { continue; }
            if (graph[ny][nx] == 1) { continue; }
            if (jumpCnt[ny][nx] >= jumpCnt[y][x] - 1) { continue; }
            q.push(make_tuple(ny, nx, cnt + 1));
            jumpCnt[ny][nx] = jumpCnt[y][x] - 1;
        }
    }

    cout << result;
}