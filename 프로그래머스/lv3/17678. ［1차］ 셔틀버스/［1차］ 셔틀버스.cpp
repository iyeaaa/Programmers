#include <bits/stdc++.h>
#define all(x) (x).begin(), (x).end()
using namespace std;
typedef pair<int, int> pii;
typedef priority_queue<pii, vector<pii>, greater<pii>> pq;

int cnt = 0;
int n, m, t;

string i2s(int v) {
    string h = to_string(v/60);
    string m = to_string(v%60);

    if (h.size() == 1)
        h = '0' + h;
    
    if (m.size() == 1)
        m = '0' + m;
    
    return h + ':' + m;
}

bool psb(pair<int, int> x, pq q) {
    q.push(x);
    
    for (int i=0; i<n; i++) {
        int arrive = i * t + 9 * 60;
        int cnt = m;
        while (!q.empty() && cnt > 0 && q.top().first <= arrive) {
            if (q.top().second)
                return true;
            q.pop();
            cnt--;
        }
    }
    
    return false;
}

string solution(int tn, int tt, int tm, vector<string> timetable) {
    n = tn, t = tt, m = tm;
    pq q;
    
    for (const string& timetable : timetable) {
        int t = stoi(timetable.substr(0,2)) * 60;
        t += stoi(timetable.substr(3));
        q.push({t, false});
    }
    
    for (int i=23*60+59; i>=0; i--)
        if (psb({i, true}, q))
            return i2s(i);
    
    return "fail";
}