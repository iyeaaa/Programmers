/**
* 메모리: 3580 KB, 시간: 44 ms
* 2022.08.26
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <queue>
using namespace std;
typedef pair<int, int> pii;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, x, y, z;
    priority_queue<int, vector<int>, greater<int>> pq;
    pii list[100001];

    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> x >> y >> z;
        list[i] = {y, z};
    }
    sort(list, list+N);

    pq.push(list[0].second);
    for (int i = 1; i < N; i++) {
        if (pq.top() <= list[i].first) pq.pop();
        pq.push(list[i].second);
    }

    cout << pq.size();
}