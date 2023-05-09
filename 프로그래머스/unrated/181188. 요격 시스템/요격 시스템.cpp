#include <bits/stdc++.h>
#define F(i, l, r) for (int i = l; i < r; i++)
using namespace std;

int solution(vector<vector<int>> targets) {
    sort(targets.begin(), targets.end());
    priority_queue<int, vector<int>, greater<int>> pq;
    int cnt = 0;
    for (auto target: targets) {
        if (pq.empty() || pq.top() > target[0]) pq.push(target[1]);
        else {
            while (!pq.empty()) pq.pop();
            pq.push(target[1]);
            cnt++;
        }
    }

    return cnt + !pq.empty();
}