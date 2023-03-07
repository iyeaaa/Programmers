#include <bits/stdc++.h>
using namespace std;

const int INF = 1'000'000'007;
int md[10][10] = {
        { 1, 7, 6, 7, 5, 4, 5, 3, 2, 3 },
        { 7, 1, 2, 4, 2, 3, 5, 4, 5, 6 },
        { 6, 2, 1, 2, 3, 2, 3, 5, 4, 5 },
        { 7, 4, 2, 1, 5, 3, 2, 6, 5, 4 },
        { 5, 2, 3, 5, 1, 2, 4, 2, 3, 5 },
        { 4, 3, 2, 3, 2, 1, 2, 3, 2, 3 },
        { 5, 5, 3, 2, 4, 2, 1, 5, 3, 2 },
        { 3, 4, 5, 6, 2, 3, 5, 1, 2, 4 },
        { 2, 5, 4, 5, 3, 2, 3, 2, 1, 2 },
        { 3, 6, 5, 4, 5, 3, 2, 4, 2, 1 },
};
int f[100'001][10][10];
int ans = INF;

int solution(string numbers) {
    numbers = "0" + numbers;
    fill(&f[0][0][0], &f[100'000][9][10], INF);
    f[0][4][6] = 0;

    for (int i=1; i<numbers.size(); i++) {
        int x = numbers[i] & 15;
        for (int j=0; j<=9; j++) {
            for (int k=0; k<=9; k++) if (j != k) {
                f[i][x][j] = min(f[i][x][j], f[i-1][k][j] + md[k][x]);
                f[i][j][x] = min(f[i][j][x], f[i-1][j][k] + md[k][x]);
            }
        }
    }

    for (int i=0; i<=9; i++)
        for (int j=0; j<=9; j++)
            ans = min(ans, f[numbers.size()-1][i][j]);

    return ans;
}

int main() {
    solution("1756");
}


// f(n, x, y): n번째에 왼쪽 손가락은 x, 오른쪽 손가락은 y일 때까지의 최소 시간
// f(n, x, y) = min(f(n-1, 0~9, y) + md, f(n-1, x, 0~9) + md)