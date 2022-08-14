/**
* 메모리: 2292 KB, 시간: 4 ms
* 2022.08.14
* by Alub
*/
#include <iostream>
#include <queue>

using namespace std;
typedef pair<int, int> pr;

bool cmp(const pr &a, const pr &b) {
    return a.first < b.first;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N; cin >> N;
    vector<pr> hmwk;
    priority_queue<int, vector<int>, less<int>> pq;

    for(int i = 0; i < N; i++) {
        int d, w; cin >> d >> w;
        hmwk.push_back({w, d});
    }

    if(N == 0) { cout << 0; return 0; }

    sort(hmwk.begin(), hmwk.end(), cmp);

    int sum = 0;
    for(int i = hmwk.back().first; i >= 1; i--) {
        while(!hmwk.empty() && hmwk.back().first >= i) {
            pq.push(hmwk.back().second);
            hmwk.pop_back();
        }
        if(pq.empty()) continue;
        sum += pq.top();
        pq.pop();
    }

    cout << sum;
}