#include <bits/stdc++.h>
using namespace std;

string ans;
char out[16];
string buf;

string solution(int n, int t, int m, int p) {
    for (int i=0; i<=9; i++)
        out[i] = i + 48;
    
    for (int i=10; i<=15; i++)
        out[i] = i + 55;
    
    int j = 0;
    while (buf.size() < t*m) {
        string two;
        int temp = j++;
        do {
            two += out[temp % n], temp /= n;
        } while (temp > 0);
        reverse(two.begin(), two.end());
        buf += two;
    }
    
    cout << buf;
    
    for (int i=1; ans.size()<t; i++)
        if (i % m == p % m) ans += buf[i-1];
    
    return ans;
}