/**
* 메모리: 2160 KB, 시간: 0 ms
* 2022.08.11
* by Alub
*/
#include <iostream>
#include <queue>

using namespace std;
typedef long long int ll;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int n, m; cin >> n >> m;
    priority_queue<ll, vector<ll>, greater<ll> > pq;

    while(n--) {
        int x; cin >> x; pq.push(x);
    }

    while(m--) {
        ll x = pq.top(); pq.pop();
        ll y = pq.top(); pq.pop();
        pq.push(x+y);
        pq.push(x+y);
    }

    ll sum = 0;
    while (!pq.empty()) {
        sum += pq.top();
        pq.pop();
    }

    cout << sum;
}