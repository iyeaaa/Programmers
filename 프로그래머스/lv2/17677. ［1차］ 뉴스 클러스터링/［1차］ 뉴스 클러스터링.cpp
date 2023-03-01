#include <bits/stdc++.h>
#define all(x) (x).begin(), (x).end()
using namespace std;

const int MAX = 26*26 + 26;
int s1[MAX], s2[MAX];
int inter = 0, merg = 0;

int solution(string str1, string str2) {
    for (int i=1; i<str1.size(); i++)
        if (isalpha(str1[i]) && isalpha(str1[i-1]))
            s1[(str1[i]&31) + (str1[i-1]&31)*26]++;
    
    for (int i=1; i<str2.size(); i++)
        if (isalpha(str2[i]) && isalpha(str2[i-1]))
            s2[(str2[i]&31) + (str2[i-1]&31)*26]++;
    
    for (int i=1; i<MAX; i++)
        inter += min(s1[i], s2[i]),
        merg += max(s1[i], s2[i]);
    
    if (inter == 0 && merg == 0)
        return 65536;
    
    return 65536 * inter / merg;
}