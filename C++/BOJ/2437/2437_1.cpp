/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.16
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int N;
int list[1001];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> list[i];
    sort(list, list+N);

    int sum = 0;
    for (int i = 0; i < N; i++) {
        if (sum + 2 <= list[i]) break;
        sum += list[i];
    }
    cout << sum+1 << endl;

    return 0;
}