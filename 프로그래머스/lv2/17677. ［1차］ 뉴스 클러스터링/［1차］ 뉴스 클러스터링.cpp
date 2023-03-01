#include <string>
#include <iostream>
#include <vector>
#include <algorithm>
#include <unordered_map>
#include <unordered_set>
#define all(x) (x).begin(), (x).end()
using namespace std;

string toLower(string s) {
    for (char& c: s)
        if (c >= 'A' && c <= 'Z')
            c += 'a' - 'A';
    return s;
}

int inter(vector<string> a, vector<string> b) {
    int cnt = 0;
    for (const string& s: a) {
        auto it = find(all(b), s);
        if (it != b.end())
            b.erase(it), cnt++;
    }
    return cnt;
}

int merge(vector<string> a, vector<string> b) {
    unordered_map<string, int> s1, s2;
    unordered_set<string> st;
    int cnt = 0;
    
    for (const string& v: a)
        s1[v]++, st.insert(v);
    
    for (const string& v: b)
        s2[v]++, st.insert(v);
    
    for (const string& v: st) 
        cnt += max(s1[v], s2[v]);
    
    return cnt;
}

int solution(string str1, string str2) {
    
    
    vector<string> a, b;
    
    for (int i=1; i<str1.size(); i++) {
        string s = toLower(str1.substr(i-1, 2));
        
        if (s[0] < 'a' || s[0] > 'z')
            continue;
        
        if (s[1] < 'a' || s[1] > 'z')
            continue;
        
        a.push_back(s);
        cout << s << '\n';
    }
    cout << '\n';
    for (int i=1; i<str2.size(); i++) {
        string s = toLower(str2.substr(i-1, 2));
        
        if (s[0] < 'a' || s[0] > 'z')
            continue;
        
        if (s[1] < 'a' || s[1] > 'z')
            continue;
        
        b.push_back(s);
        cout << s << '\n';
    }
    
    if (a.empty() && b.empty())
        return 65536;
    
    return 65536 * inter(a, b) / merge(a, b);
}