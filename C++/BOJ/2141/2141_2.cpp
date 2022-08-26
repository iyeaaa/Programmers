/**
* 메모리: 4364 KB, 시간: 32 ms
* 2022.08.26
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long int ll;

ll N, x, a;
ll sum[100001];
pair<ll, ll> XA[100001];

void solve() {
    for (int i = 0; i < N; i++) {
        if (sum[N-1] - sum[i] - sum[i] <= 0) {
            cout << XA[i].first;
            break;
        }
    }
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> x >> a;
        XA[i] = {x, a};
    }
    sort(XA, XA+N);

    sum[0] = XA[0].second;
    for (int i = 1; i < N; i++)
        sum[i] = sum[i-1] + XA[i].second;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}

