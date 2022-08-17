/**
* 메모리: 2800 KB, 시간: 28 ms
* 2022.08.17
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;

typedef long long int ll;

int N;
int house[200001];

void input() {
    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> house[i];
    sort(house, house+N);
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input();
    cout << house[(N-1)/2] << endl;
}