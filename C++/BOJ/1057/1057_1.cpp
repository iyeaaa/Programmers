/**
* 메모리: 2560 KB, 시간: 0 ms
* 2022.09.04
* by Alub
*/
#include <iostream>
#include <queue>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, K, I;
    queue<int> L;
    queue<int> nL;
    int KIM = 1000001, IM = 1000001;

    cin >> N >> K >> I;

    for (int i = 1; i <= N; i++) {
        if (i == K) {
            L.push(KIM);
        } else if (i == I) {
            L.push(IM);
        } else {
            L.push(i);
        }
    }

    int round = 1;
    while (true) {
        if (L.empty()) {
            if (nL.size() == 1) {
                cout << -1;
                return 1;
            } else {
                round += 1;
                L = nL;
                nL = queue<int>();
            }
        } else if (L.size() == 1) {
            nL.push(L.front());
            L.pop();
        } else {
            int first = L.front(); L.pop();
            int second = L.front(); L.pop();

            if (first == KIM && second == IM) {
                cout << round;
                return 0;
            } else {
                nL.push(max(first, second));
            }
        }
    }
}