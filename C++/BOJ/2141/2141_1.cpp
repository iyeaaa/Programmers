/**
* 메모리: 4364 KB, 시간: 36 ms
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

bool haveToLf(int mid) {
    return sum[mid] >= sum[N-1] - sum[mid];
}

void solve() {
    int lf = 0, ryt = N-1;
    for (int mid = (lf+ryt)/2; lf <= ryt; mid = (lf+ryt)/2) {
        if (haveToLf(mid))
            ryt = mid - 1;
        else
            lf = mid + 1;
    }
    cout << XA[lf].first;
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

