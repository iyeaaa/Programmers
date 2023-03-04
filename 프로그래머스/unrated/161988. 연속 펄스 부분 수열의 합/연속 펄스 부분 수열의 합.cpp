#include <bits/stdc++.h>
using namespace std;

long long ans;
vector<int> s1, s2;
long long dp1[500'001], dp2[500'001];

long long solution(vector<int> sequence) {
    s1 = s2 = sequence;
    
    for (int i=0, j=1; i<s1.size(); i++, j*=-1)
        s1[i] *= j, s2[i] *= -j;
    
    dp1[0] = s1.front(), dp2[0] = s2.front();
    ans = max(ans, max(dp1[0], dp2[0]));
    
    for (int i=1; i<s1.size(); i++) {
        dp1[i] = max(1ll * s1[i], s1[i] + dp1[i-1]);
        dp2[i] = max(1ll * s2[i], s2[i] + dp2[i-1]);
        ans = max(ans, max(dp1[i], dp2[i]));
    }
    
    return ans;
}