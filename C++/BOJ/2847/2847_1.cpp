/**
* 메모리: 2020 KB, 시간: 0 ms
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

    int N; cin >> N;
    int level[101];

    for (int i = 0; i < N; i++)
        cin >> level[i];

    int count = 0;
    for (int i = N-2; i >= 0; i--) {
        if (level[i+1] <= level[i]) {
            count += level[i] - (level[i+1]-1);
            level[i] = level[i+1]-1;
        }
    }

    cout << count << endl;
}
