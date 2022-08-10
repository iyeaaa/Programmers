/**
* 메모리: 3140 KB, 시간: 152 ms
* 2022.08.10
* by Alub
*/
#include <iostream>
#include <deque>
#include <tuple>
#include <vector>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, M, K; cin >> N >> M >> K;
    int nour[11][11]; fill(&nour[0][0], &nour[10][11], 5);
    int A[11][11];
    deque<int> trees[11][11];
    int near_y[] = {-1, -1, -1, 0, 0, 1, 1, 1};
    int near_x[] = {-1, 0, 1, -1, 1, -1, 0, 1};

    for(int i = 1; i <= N; i++)
        for(int j = 1; j <= N; j++) {
            int x; cin >> x;
            A[i][j] = x;
        }

    for(int i = 1; i <= M; i++) {
        int x, y, z; cin >> x >> y >> z;
        trees[x][y].push_front(z);
    }

    while(K--) {
        vector<tuple<int, int, int>> dead;

        // spring
        for(int i = 1; i <= N; i++) {
            for(int j = 1; j <= N; j++) {
                for(int k = 0; k < trees[i][j].size(); k++) {
                    if(trees[i][j][k] <= nour[i][j]) {
                        nour[i][j] -= trees[i][j][k];
                        trees[i][j][k] += 1;
                    } else {
                        for(int l = trees[i][j].size() - 1; l >= k; l--) {
                            dead.push_back({trees[i][j][l], i, j});
                            trees[i][j].pop_back();
                        }
                        break;
                    }
                }
            }
        }

        // summer
        for(auto [age, y, x]: dead) {
            nour[y][x] += age / 2;
        }

        // fall
        for(int i = 1; i <= N; i++) {
            for(int j = 1; j <= N; j++) {
                for(auto tree: trees[i][j]) {
                    if(tree % 5 != 0) continue;
                    for(int k = 0; k < 8; k++) {
                        int ny = i+near_y[k], nx = j+near_x[k];
                        if(ny < 1 || ny > N || nx < 1 || nx > N) continue;
                        trees[ny][nx].push_front(1);
                    }
                }
            }
        }

        // winter
        for(int i = 1; i <= N; i++)
            for(int j = 1; j <= N; j++)
                nour[i][j] += A[i][j];
    }

    int sum = 0;
    for(int i = 1; i <= N; i++)
        for(int j = 1; j <= N; j++)
            sum += trees[i][j].size();

    cout << sum;

}