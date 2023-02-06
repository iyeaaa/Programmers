#include <bits/stdc++.h>
using namespace std;

int gcd(int y, int x) {
    return x==0 ? y : gcd(x, y%x);
}

int f(const vector<int> &a, const vector<int> &b){
    int x = a[0];
    
    for (int v : a) 
        x = gcd(x, v);
    
    for (int v : b)
        if (v % x == 0)
            return 0;
    
    return x;
}

int solution(vector<int> a, vector<int> b) {
    return max(f(a, b), f(b, a));
}