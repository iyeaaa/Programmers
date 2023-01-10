#include <iostream>
#include <algorithm>
#include <vector>
#include <cmath>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int> tii;

const int MAX = 500005;
int N;
int L[MAX], sum, cnt[10000];
vector<int> mode;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    cin >> N;
    for (int i=0; i<N; i++) cin >> L[i], sum+=L[i], cnt[L[i]+4000]++;
    sort(L, L+N);

    cout << int(round(double(sum)/N)) << '\n';
    cout << L[N/2] << '\n';

    int mx = *max_element(cnt, cnt+10000);
    for (int i=0; i<=8001; i++) if (cnt[i] == mx) {
        mode.push_back(i-4000);
    }

    cout << (mode.size() == 1 ? mode[0] : mode[1]) << '\n';
    cout << L[N-1] - L[0];
}