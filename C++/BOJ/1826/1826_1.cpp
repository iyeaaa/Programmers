/**
* 메모리: 2336 KB, 시간: 4 ms
* 2022.08.23
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
using namespace std;
typedef pair<int, int> pii;

struct cmp {
    bool operator()(pii a, pii b) {
        return a.second < b.second;
    }
};

priority_queue<pii, vector<pii>, cmp> bought;
int N, a, b, L, P;
vector<pii> oil;

void solve() {
    int curLct = 0;
    int curOil = P;
    int stopCnt = 0;

    for (; curLct < L; curLct++, curOil--) {
        if (curOil > 0)
            continue;

        while (!oil.empty() && oil.back().first <= curLct)
            bought.push(oil.back()), oil.pop_back();

        if (bought.size() == 0 || curLct < bought.top().first) {
            cout << -1;
            return;
        }

        curOil = bought.top().second, bought.pop();
        stopCnt++;
    }

    cout << stopCnt;
}

void input() {
    cin >> N;
    for(int i=0;i<N;i++) {
        cin >> a >> b;
        oil.push_back({a, b});
    }
    sort(oil.begin(), oil.end(), greater<pii>());
    cin >> L >> P;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
