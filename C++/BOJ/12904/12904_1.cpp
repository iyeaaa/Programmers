/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.17
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <string>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    string S, T; cin >> S >> T;
    int result = 1;

    while(1) {
        if (T.size() == S.size()) {
            if (T != S)
                result = 0;
            break;
        }
        if (T.back() == 'A') {
            T.pop_back();
        } else if (T.back() == 'B') {
            T.pop_back();
            reverse(T.begin(), T.end());
        }
    }

    cout << result;
}