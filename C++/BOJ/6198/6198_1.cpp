/**
* 메모리: 2916 KB, 시간: 8 ms
* 2022.09.20
* by Alub
*/
#include <iostream>
#include <vector>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    long long int N, x, ans = 0;
    vector<int> s;

    cin >> N;

    for (int i = 0; i < N; i++) {
        cin >> x;
        while (!s.empty() && s.back() <= x)
            s.pop_back();
        ans += s.size();
        s.push_back(x);
    }

    cout << ans;
}