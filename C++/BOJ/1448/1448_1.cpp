/**
* 메모리: 5804 KB, 시간: 160 ms
* 2022.08.22
* by Alub
*/
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

bool isPsb(int x, int y, int z) {
    return x < y+z;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, list[1000001], answer = -1;
    cin >> N;
    for(int i=0;i<N;i++) cin >> list[i];
    sort(list, list+N, greater<int>());

    for(int i = 0; i < N-2; i++)
        if (isPsb(list[i], list[i+1], list[i+2])) {
            answer = list[i] + list[i + 1] + list[i + 2];
            break;
        }

    cout << answer;
}
