
#include <iostream>
#include <algorithm>
using namespace std;

const int MAX = 1000005;
int isPrime[MAX], n;

void Sieve() {
    fill(isPrime,isPrime+MAX,1);
    isPrime[0]=0; isPrime[1]=0;
    for (int i=2; i<MAX; i++) if (isPrime[i])
        for (int j=i+i; j<MAX; j+=i)
            isPrime[j] = false;
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    Sieve();
    while (true) {
        cin >> n;
        if (n == 0) break;

        for (int i=1; i<n; i++)
            if (isPrime[i] && isPrime[n-i]) {
                cout << n << " = " << i << " + " << n-i << '\n';
                break;
            }
    }
}