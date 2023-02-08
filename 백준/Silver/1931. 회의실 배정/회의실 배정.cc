#include <iostream>
#include <algorithm>
#include <vector>
#define FIO ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
using namespace std;
typedef pair<int, int> pii;

int N, ans;
vector<pii> t;

int main() {
    FIO
    cin >> N;
    for (int i=0; i<N; i++) {
        int s, e; cin >> s >> e;
        t.push_back({e, s});
    }

    sort(t.begin(), t.end());
    int lastEnd = 0;

    for (auto [e, s]: t)
        if (lastEnd <= s)
            ans++, lastEnd = e;

    cout << ans;
}
