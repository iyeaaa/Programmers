/**
* 메모리: 2060 KB, 시간: 0 ms
* 2022.08.19
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;

int N, M, x, L[10001];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    cin >> N >> M;
    while(N--) cin >> x, L[x]++;
    for(int i=0; i<=M; i++) M+=L[i];
    cout << M;
}