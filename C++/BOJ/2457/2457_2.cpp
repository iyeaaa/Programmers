/**
* 메모리: 3688 KB, 시간: 36 ms
* 2022.08.21
* by Alub
*/
#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;
typedef pair<int, int> pii;

bool cmp(const pii& a, const pii& b) {
    return a.first > b.first;
}

int N;
vector<pii> stack;
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
        while (!stack.empty() && stack.back().first <= notBlsmStt) {
            deadStt = max(deadStt, stack.back().second);
            stack.pop_back();
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
        stack.push_back({mtod(a, b), mtod(c, d)});
    }
    sort(stack.begin(), stack.end(), cmp);
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input(), solve();
}