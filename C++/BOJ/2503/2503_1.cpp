/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.07
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

bool psb[1000];
int x, s, b;

pair<int, int> scan(int i1, int i2) {
    int strike = 0;
    int ball = 0;
    string s1 = to_string(i1);
    string s2 = to_string(i2);

    for (int i = 0; i < 3; i++) {
        if (s1[i] == s2[i])
            strike++;
        else {
            for (int j = 0; j < 3; j++)
                if (s1[i] == s2[j]) {
                    ball++;
                    break;
                }
        }
    }

    return {strike, ball};
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N; cin >> N;
    for (int i = 100; i <= 999; i++) psb[i] = true;

    for (int i = 0; i < N; i++) {
        cin >> x >> s >> b;
        for (int j = 100; j <= 999; j++) if (psb[j]) {
            pair<int, int> pr = scan(j, x);
            if (pr.first != s || pr.second != b)
                psb[j] = false;
        }
    }

    int cnt = 0;
    for (int i = 100; i <= 999; i++) {
        if (!psb[i]) continue;
        string st = to_string(i);
        if (st[0] == st[1] || st[1] == st[2] || st[0] == st[2] ||
        st[0] == '0' || st[1] == '0' || st[2] == '0')
            continue;
        cnt++;
    }

    cout << cnt;
}