/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.16
* by Alub
*/
#include <iostream>
#include <algorithm>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    string strn;
    getline(cin, strn);

    char ucpc[] = {'U', 'C', 'P', 'C'};

    int idx = 0;
    for (auto c: strn)
        if (c == ucpc[idx]) {
            idx++;
            if (idx == 4) {
                cout << "I love UCPC" << endl;
                return 0;
            }
        }

    cout << "I hate UCPC" << endl;
}
