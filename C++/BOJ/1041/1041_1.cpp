/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.17
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <numeric>

using namespace std;

typedef long long int ll;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    ll N; cin >> N;
    ll list[7]; list[0] = 0;

    for (int i = 1; i <= 6; i++)
        cin >> list[i];

    ll one = *min_element(list + 1, list + 7);
    ll two = 10000000;
    ll three = 10000000;

    if (N == 1) {
        cout << accumulate(begin(list), end(list), 0) - *max_element(list+1, list+7);
        return 0;
    }

    for (int i = 1; i <= 6; i++)
        for (int j = i+1; j <= 6; j++) {
            if (i + j != 7)
                two = min(two, list[i]+list[j]);
            for (int k = j+1; k <= 6; k++) {
                if (i+j == 7 || j+k == 7 || k+i == 7)
                    continue;
                three = min(three, list[i]+list[j]+list[k]);
            }
        }

    cout << 4*three + (2*N-3)*4*two + (5*(N-2)*(N-2)+4*(N-2))*one << endl;
}