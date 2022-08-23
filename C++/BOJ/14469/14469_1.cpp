/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.23
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;
typedef pair<int, int> pii;

int N, x, y;
pii cow[101];


void solve() {
    int lastEndTime = 0;
    for (int i = 0; i < N; i++)
        if (cow[i].first >= lastEndTime)
            lastEndTime = cow[i].first + cow[i].second;
        else
            lastEndTime += cow[i].second;
    cout << lastEndTime;
}

void input() {
    cin >> N;
    for(int i=0;i<N;i++) {
        cin >> x >> y;
        cow[i] = {x, y};
    }
    sort(cow, cow+N);
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
