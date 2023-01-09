#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int> tii;

const int MAX = 1000005;
int M, N, isPrime[MAX];

void Sieve() {
    fill(isPrime,isPrime+MAX,true);
    isPrime[0] = false, isPrime[1] = false;
    for (int i=2; i<=N; i++) if (isPrime[i]) {
        for (int j=i+i; j<=N; j+=i)
            isPrime[j] = false;
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    cin >> M >> N;
    Sieve();
    for (int i=M; i<=N; i++) if(isPrime[i])
        cout << i << '\n';
}