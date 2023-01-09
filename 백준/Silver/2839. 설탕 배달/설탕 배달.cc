#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int> tii;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N, ans=0; cin >> N;
    while (N > 0) {
        if (N%5 == 0) {ans+=N/5;break;}
        N -= 3; ans++;
    }
    cout << (N<0 ? -1 : ans);
}