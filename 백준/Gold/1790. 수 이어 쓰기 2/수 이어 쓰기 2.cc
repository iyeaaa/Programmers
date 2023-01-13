
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
            ll nb = pow(10, i-1) + (k%i==0 ? k/i-1 : k/i);
            if (nb > N) {
                cout << -1;
            } else {
                cout << to_string(nb)[--k % i];
            }
            return 0;
        } else {
            k -= len;
            cnt *= 10;
            len = cnt*(i+1);
        }
    }
}