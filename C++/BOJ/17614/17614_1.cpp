/**
* 메모리: 2020 KB, 시간: 28 ms
* 2022.09.18
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int add(int n) {
    int result = 0;
    string s = to_string(n);
    for (auto v: s) if (v == '3' || v == '6' || v == '9')
        result += 1;
    return result;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N; cin >> N;
    int answer = 0;

    for (int i = 3; i <= N; i++)
        answer += add(i);

    cout << answer;
}