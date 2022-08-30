/**
* 메모리: 2212 KB, 시간: 0 ms
* 2022.08.30
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
typedef long long int ll;
typedef pair<ll, ll> pll;

ll N, answer; pll cnt[10];
string x;

int findMin() {
    int idx = -1;
    long minValue = 999999999999999999;
    for (int i = 0; i < 10; i++) if (!cnt[i].second && minValue > cnt[i].first)
        idx = i, minValue = cnt[i].first;
    return idx;
}

void solve() {
    int minIdx = findMin();
    int c = 9;
    for (int i = 9; i >= 0 && cnt[i].first > 0; i--) if (i != minIdx)
        answer += cnt[i].first*(c--);
    cout << answer;
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> x;
        cnt[x[0]-65].second = true;
        for (int j = 0; j < x.size(); j++)
            cnt[x[j]-65].first += pow(10, x.size()-1-j);
    }
    sort(cnt, cnt+10, less<pll>());
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}

