/**
* 메모리: 91748 KB, 시간: 112 ms
* 2022.10.29
* by Alub
*/
#include <iostream>
using namespace std;

int MOD = 1000000007;
int MAX = 5*1515, N, ans;
int memo[1516][1515*5+1][2];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N;

    memo[1][1][0] = 1;
    memo[1][5][1] = 1;

    for (int i = 2; i <= N; i++) {
        for (int j = 1; j <= MAX; j++)
            memo[i][j][0] = (memo[i-1][j-1][0] + memo[i-1][j-1][1]) % MOD;
        for (int j = 5; j <= MAX; j++)
            memo[i][j][1] = (memo[i-1][j-5][0] + memo[i-1][j-5][1]) % MOD;
    }

    for (int i = 3; i <= MAX; i+=3) {
        ans = (ans + memo[N][i][1]) % MOD;
    }

    cout << ans;
}
