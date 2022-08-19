/**
* 메모리: 3848 KB, 시간: 80 ms
* 2022.08.19
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;
typedef long long int ll;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N; cin >> N;
    int list[N+1];
    ll sum = 0;

    for (int i = 1; i <= N; i++)
        cin >> list[i];

    sort(list+1, list+N+1);

    for (int i = 1; i <= N; i++)
        sum += abs(i-list[i]);

    cout << sum << endl;
}