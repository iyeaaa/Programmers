/**
* 메모리: 212040 KB, 시간: 788 ms
* 2022.08.11
* by Alub
*/
#include <iostream>
#include <set>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    set<string> overlap;
    string strn; cin >> strn;

    for(int i = 1; i <= strn.size(); i++)
        for(int j = 0; j <= strn.size()-i; j++)
            overlap.insert(strn.substr(j, i));

    cout << overlap.size();
}