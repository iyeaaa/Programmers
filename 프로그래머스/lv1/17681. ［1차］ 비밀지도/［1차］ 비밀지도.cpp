#include <bits/stdc++.h>
using namespace std;

vector<string> ans;

vector<string> solution(int n, vector<int> arr1, vector<int> arr2) {
    for (int i=0; i<n; i++) {
        int info = arr1[i] | arr2[i];
        string s;
        
        for (int j=n-1; j>=0; j--)
            s += ((info & (1 << j)) ? '#' : ' ');
        
        ans.push_back(s);
    }
    
    return ans;
}