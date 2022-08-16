/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.16
* by Alub
*/
#include <iostream>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, M; cin >> N >> M;
    if (N <= 2) {
        if (N == 1) cout << 1;
        else if (M % 2 == 0)
            cout << (M <= 8 ? M/2 : 4);
        else
            cout << (M <= 8 ? M/2+1 : 4);
    }
    else
        cout << (M <= 5 ? M <= 4 ? M : 4 : 4+M-6);

    return 0;
}