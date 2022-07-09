#include <iostream>
#include <string>
#include <queue>


#define X first
#define Y second
#define SIZE 1000

using namespace std;

int dx[4] = { -1,1,0,0 };
int dy[4] = { 0,0,-1,1 };

char arr[SIZE][SIZE]; //입력
int visited[SIZE][SIZE][11]; // 0 벽을 안깼다, 1 개깼다 .. 10개 깼다.

int r, c, crush;

typedef struct Position {
    int x;
    int y;
    int wall;
}Pos;


int BFS(int _x, int _y) {
    queue<Pos> q;
    Pos p; // 처음 위치, 깬 벽 0
    p.x = _x;
    p.y = _y;
    p.wall = 0;

    q.push(p);
    visited[_x][_y][0] = 1; //안 깬상태로 방문
    while (!q.empty()) {
        auto cur = q.front();
        int w = cur.wall; // 벽을 깼는지
        q.pop();

        //해당 위치 도달했으면
        if (cur.x == r - 1 && cur.y == c - 1)
            return visited[cur.x][cur.y][w]; //시작하는 칸도 포함


        //BFS
        for (int dir = 0; dir < 4; dir++) {
            int nx = cur.x + dx[dir];
            int ny = cur.y + dy[dir];
            //범위
            if (nx < 0 || nx >= r || ny < 0 || ny >= c) continue;
            //벽으로 막혀있는데 아직 벽 깰 수 있으면
            //+ visited[nx][ny][w+1] 조건이 없으면 다른 경로로 온 애도 해당 노드를 방문해서 숫자를 바꿔버리고 거기서부터 또함 ** 이게 제일 중요한 조건 **
            if (arr[nx][ny] == '1' && w < crush && visited[nx][ny][w+1] == 0) {

                Pos tempP;
                tempP.x = nx;
                tempP.y = ny;
                tempP.wall = w+1;
                q.push(tempP);
                visited[nx][ny][w + 1] = visited[cur.x][cur.y][w] + 1;
            }
            //벽이 없고 현재 상태에서 방문하지 않은 곳이라면
            else if (arr[nx][ny] == '0' && visited[nx][ny][w] == 0) {
                Pos tempP;
                tempP.x = nx;
                tempP.y = ny;
                tempP.wall = w;
                q.push(tempP);
                visited[nx][ny][w] = visited[cur.x][cur.y][w] + 1;
            }

        }
    }
    return -1;
}



int main() {
    cin >> r >> c >> crush;

    //노드입력
    for (int i = 0; i < r; i++) {
        string s;
        cin >> s;
        for (int j = 0; j < c; j++) {
            arr[i][j] = s[j];
        }
    }

    int dist = BFS(0, 0);
    cout << dist;

    return 0;
}