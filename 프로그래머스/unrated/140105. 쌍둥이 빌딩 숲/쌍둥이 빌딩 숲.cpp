#include <bits/stdc++.h>
using namespace std;

// f(x, y): x종류의 블록으로 y채의 빌딩이 구분되어 보이게 하는 경우의 수
// f(x, y) = f(x-1, y) * 2(x-1) + f(x-1, y-1)
// f(0, 0) = 1, else f(x, 0) = f(0, y) = 0

const long long MOD = 1'000'000'007;
long long f[101][101];

int solution(int x, int y) {
    f[0][0] = 1;
    for (int i=1; i<=x; i++)
        for (int j=1; j<=y; j++)
            f[i][j] = (f[i-1][j] * 2 * (i-1) + f[i-1][j-1]) % MOD;
    return f[x][y];
}