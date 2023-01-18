
#include <iostream>
#include <algorithm>
#define FIO ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
using namespace std;

const int MAX = 40005, MOD = 123456789;
int N, P[MAX], dp[MAX];

void Sieve() {
    fill(P+2, P+MAX, true);
    for (int i=2; i<MAX; i++) if (P[i])
        for (int j=i+i; j<MAX; j+=i)
            P[j] = false;
}

int main() {
    FIO
    cin >> N;
    Sieve();
    dp[0] = 1;

    for (int i=2; i<=N; i++) if (P[i])
        for (int j=i; j<=N; j++)
            dp[j] = (dp[j] + dp[j-i]) % MOD;

    cout << dp[N];
}