
#include <iostream>
#include <algorithm>
#define FIO ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
using namespace std;

int N, ans=1, color[500001];

void Sieve() {
    for (int i=2; i<=N; i++) if (!color[i]) {
        ans++;
        for (int j=i; j<=N; j+=i)
            if (!color[j])
                color[j] = ans;
    }
}

int main() {
    FIO
    cin >> N;
    Sieve();
    color[1] = 1;
    cout << ans << '\n';
    for (int i=1; i<=N; i++) cout << color[i] << ' ';
}