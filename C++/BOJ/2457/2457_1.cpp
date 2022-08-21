/**
* 메모리: 3684 KB, 시간: 44 ms
* 2022.08.21
* by Alub
*/
#include <algorithm>
#include <iostream>
#include <queue>

using namespace std;
typedef pair<int, int> pii;

struct cmp {
    bool operator()(pii a, pii b) {
        return a.first > b.first;
    }
};

int N;
priority_queue<pii, vector<pii>, cmp> pq;
int month[] = {0,31,28,31,30,31,30,
               31,31,30,31,30,31};

int mtod(int m, int d) {
    int sum = 0;
    for (int i = 1; i < m; i++)
        sum += month[i];
    return sum+d;
}

void solve() {
    int notBlsmStt = mtod(3, 1);
    int end = mtod(11, 30);
    int cnt = 0;
    while (notBlsmStt <= end) {
        int deadStt = -1;
        while (!pq.empty() && pq.top().first <= notBlsmStt) {
            deadStt = max(deadStt, pq.top().second);
            pq.pop();
        }
        if (deadStt == -1) {
            cout << 0;
            return;
        } else {
            notBlsmStt = deadStt;
            cnt++;
        }
    }
    cout << cnt;
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++) {
        int a, b, c, d;
        cin >> a >> b >> c >> d;
        if (a >= c && b >= d) continue;
        pq.push({mtod(a, b), mtod(c, d)});
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input(), solve();
}