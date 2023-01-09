#include <iostream>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int> tii;

const int MAX = 123460*2;
int isPrime[MAX];

void sieve() {
    fill(isPrime, isPrime+MAX, 1);
    isPrime[0] = 0, isPrime[1] = 0;
    for (int i=2; i<MAX; i++) if (isPrime[i])
        for (int j=i+i; j<MAX; j+=i)
            isPrime[j] = 0;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    sieve();
    int n;

    while (1) {
        cin >> n;
        if (n == 0) break;
        int ans = 0;

        for (int i=n+1; i<=2*n; i++)
            if (isPrime[i])
                ans++;

        cout << ans << '\n';
    }
}