/**
* 메모리: 5816 KB, 시간: 4 ms
* 2022.07.20
* by Alub
*/
#include <iostream>
#include <string>

using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(nullptr);

    string strn1;
    string strn2;

    cin >> strn1 >> strn2;
    int dp[1001][1001] = {};

    for(int i = 1; i <= strn1.length(); i++) {
        for(int j = 1; j <= strn2.length(); j++) {
            if (strn1[i-1] == strn2[j-1]) {
                dp[i][j] = dp[i-1][j-1] + 1;
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
            }
        }
    }

    cout << dp[strn1.length()][strn2.length()] << '\n';
    return 0;
}
