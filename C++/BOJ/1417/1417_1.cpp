/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.21
* by Alub
*/
#include <algorithm>
#include <iostream>
#include <queue>

using namespace std;

int N, dasom, cnt=0;
priority_queue<int, vector<int>, less<int>> pq;

void solve() {
    while (!pq.empty() && dasom <= pq.top()) {
        dasom++, cnt++;
        pq.push(pq.top()-1);
        pq.pop();
    }
    cout << cnt;
}

void input() {
    cin >> N >> dasom;
    for(int i=1; i<N; i++) {
        int x; cin >> x;
        pq.push(x);
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input(), solve();
}