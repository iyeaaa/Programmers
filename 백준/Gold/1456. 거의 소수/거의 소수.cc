
#include <iostream>
#include <algorithm>
#define FIO ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
using namespace std;
typedef long long ll;

ll A, B, ans;
bool isPrime[10000001];

void Sieve() {
    const int MAX = 10000001;
    fill(isPrime+2, isPrime+MAX, true);
    for (ll i=2; i<MAX; i++) if (isPrime[i])
        for (ll j=i+i; j<MAX; j+=i)
            isPrime[j] = false;
}

int main() {
    FIO Sieve();
    cin >> A >> B;
    for (ll i=2; i*i<=B; i++) if (isPrime[i]) {
        ll p = i;
        while (i <= B/p) {
            if (p*i>=A) ans++;
            p *= i;
        }
    }
    cout << ans;
}