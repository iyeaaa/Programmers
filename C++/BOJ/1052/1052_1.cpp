/**
* 메모리: 2020 KB, 시간: 740 ms
* 2022.08.20
* by Alub
*/
#include <algorithm>
#include <iostream>


using namespace std;

int N, K;

void solve() {
    int buyCnt = 0;

    while (true) {
        int cnt = 0, n = N;

        while (n != 0) {
            int i = 1;
            while (i <= n) i*=2;
            i /= 2;
            n -= i;
            cnt++;
        }

        if (cnt <= K) break;
        buyCnt++, N++;
    }

    cout << buyCnt;
}

void input() {
    cin >> N >> K;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input(); solve();
}