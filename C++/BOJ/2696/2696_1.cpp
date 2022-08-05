/**
* 메모리: 2156 KB, 시간: 0 ms
* 2022.08.05
* by Alub
*/
#include <iostream>
#include <queue>

using namespace std;

void solve() {
    priority_queue<int, vector<int>, less<int>> maxHeap;
    priority_queue<int, vector<int>, greater<int>> minHeap;

    int M; cin >> M; cout << (M%2 == 0 ? M/2 : M/2+1) << '\n';
    int first; cin >> first; maxHeap.push(first);
    cout << first << ' ';
    for(int i = 2; i <= M; i++) {
        int cur; cin >> cur;
        if (i % 2 == 0) {   // minHeap.count + 1 == maxHeap.count, minHeap <- Element
            if (maxHeap.top() >= cur) {
                minHeap.push(maxHeap.top());
                maxHeap.pop();
                maxHeap.push(cur);
            } else minHeap.push(cur);
        } else {    // minHeap.count == maxHeap.count, maxHeap <- Element
            if (cur > minHeap.top()) {
                maxHeap.push(minHeap.top());
                minHeap.pop();
                minHeap.push(cur);
            } else maxHeap.push(cur);
            cout << maxHeap.top() << ' ';
        }
        if (i % 20 == 0) cout << "\n";
    }
    cout << '\n';
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int T; cin >> T;

    while(T--) {
        solve();
    }
}