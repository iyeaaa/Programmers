#include <bits/stdc++.h>
#define all(x) (x).begin(), (x).end()
using namespace std;

string i2s(int v) {
    string h = to_string(v/60);
    string m = to_string(v%60);

    if (h.size() == 1)
        h = '0' + h;
    
    if (m.size() == 1)
        m = '0' + m;
    
    return h + ':' + m;
}

string solution(int n, int t, int m, vector<string> timetable) {
    priority_queue<int, vector<int>, greater<int>> q;
    
    for (const string& timetable : timetable) {
        int t = stoi(timetable.substr(0,2)) * 60;
        t += stoi(timetable.substr(3));
        q.push(t);
    }
    
    for (int i=0; i<n; i++) {
        int cnt = m;
        int arrive = i*t + 9*60;
        int last = 0;
        
        while (!q.empty() && cnt > 0 && q.top() <= arrive)
            last = q.top(), q.pop(), cnt--;
        
        if (i == n-1) {
            if (cnt > 0) return i2s(i*t + 9*60);
            else return i2s(last-1);
        }
    }
    
    return i2s(q.top());
}