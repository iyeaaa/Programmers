/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.02
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int E, S, M, i;

void solve() {
    for (i = 1; i%15!=E%15||i%28!=S%28||i%19!=M%19 ;i++){}
    cout << i;
}

void input() {
    cin >> E >> S >> M;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
