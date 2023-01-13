
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
typedef long long ll;

ll N, k, cnt, len;

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> N >> k;
    cnt = 9, len=9;

    for (int i=1;; i++) {
        if (k-len <= 0) {
            ll s = pow(10, i-1);
            ll e = s*10;
            for (int j=s; j<min(N+1,e); j++) {
                if (k-i <= 0) {
                    cout << to_string(j)[k-1];
                    return 0;
                }
                k -= i;
            }
            cout << -1;
            return 0;
        } else {
            k -= len;
            cnt *= 10;
            len = cnt*(i+1);
        }
    }
}