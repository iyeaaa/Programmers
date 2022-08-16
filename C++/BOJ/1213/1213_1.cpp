/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.16
* by Alub
*/
#include <iostream>
#include <string>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);

    int engCnt[26];
    fill(engCnt, engCnt + 26, 0);
    string x;
    cin >> x;
    string result;

    for (char c: x)
        engCnt[c - 65]++;

    char one = -1;
    for (int i = 0; i < 26; i++) {
        if (engCnt[i] % 2 == 1) {
            if (one != -1) {
                cout << "I'm Sorry Hansoo";
                return 0;
            }
            engCnt[i]--;
            one = i;
        }
        for (int j = 0; j < engCnt[i]; j++)
            result.insert(result.size()/2, string(1, (char)(i+65)));
    }

    if (one != -1)
        result.insert(result.size()/2, string(1, (char)(one+65)));

    cout << result;
}
