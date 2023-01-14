
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
typedef long long ll;

int N, ans;
vector<int> p = {0};

void Sieve() {
    int isPrime[N+1];
    fill(isPrime,isPrime+N+1,1);
    isPrime[0]=0; isPrime[1]=0;
    for (int i=2; i<=N; i++) if (isPrime[i]) {
        for (int j = i + i; j <= N; j += i)
            isPrime[j] = 0;
    }
    for (int i=2; i<=N; i++)
        if (isPrime[i])
            p.push_back(i);
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> N;
    Sieve();

    int lo=0, hi=1, len=p.size(), sum=p[1];
    while (lo < hi && hi < len) {
        if (sum < N) sum+=p[++hi];
        else if (sum > N) sum-=p[++lo];
        else ans++, sum+=p[++hi];
    }

    cout << ans;
}