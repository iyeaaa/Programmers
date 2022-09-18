/**
* 메모리: 2292 KB, 시간: 0 ms
* 2022.09.18
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <set>
#include <string>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    string S;
    int N;
    set<string> list;

    cin >> S;
    N = S.size();

    for (int i = 1; i < N; i++)
        for (int j = i+1; j < N; j++) {
            string s1 = S.substr(0, i);
            string s2 = S.substr(i, j - i);
            string s3 = S.substr(j, N - j);
            reverse(s1.begin(), s1.end());
            reverse(s2.begin(), s2.end());
            reverse(s3.begin(), s3.end());
            list.insert(s1 + s2 + s3);
        }
    
    cout << *list.begin();
}