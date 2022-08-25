/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.25
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, A, B, C, D[102];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N >> A >> B >> C;
    for (int i = 1; i <= N; i++)
        cin >> D[i];
    sort(D+1, D+N+1, greater<int>());

    int maxValue = C/A;
    int calorie = C;
    for (int i = 1; i <= N; i++) {
        calorie += D[i];
        maxValue = max(maxValue, (calorie)/(A+B*i));
    }

    cout << maxValue;
}

