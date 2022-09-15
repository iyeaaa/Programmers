/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.15
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int L[] = {1, 1, 2, 2, 2, 8};
    int x;
    for (int v: L) {
        cin >> x;
        cout << v-x << ' ';
    }
}