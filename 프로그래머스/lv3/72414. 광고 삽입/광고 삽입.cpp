#include <string>
#include <vector>
using namespace std;

long long psum[360005];
long long number[360005];
long long play_time;
long long adv_time;
long long mxTime;
string ans;

string toHMS(long long second) {
    string h = to_string(second / 3600);
    second %= 3600;
    while (h.size() <= 1)
        h = '0' + h;
    
    string m = to_string(second / 60);
    second %= 60;
    while (m.size() <= 1)
        m = '0' + m;
    
    string s = to_string(second);
    while (s.size() <= 1)
        s = '0' + s;
    
    return h + ':' + m + ':' + s;
}

long long toSecond(const string& s, int pos) {
    int rtn = 0;
    rtn += stoi(s.substr(pos, 2))   * 3600;
    rtn += stoi(s.substr(pos+3, 2)) * 60;
    rtn += stoi(s.substr(pos+6, 2));
    return rtn;
}

string solution(string p, string a, vector<string> logs) {
    play_time = toSecond(p, 0);
    adv_time = toSecond(a, 0);
    
    for (const string& s: logs) {
        psum[toSecond(s, 0)]++;
        psum[toSecond(s, 9)]--;
    }
    
    for (int i=1; i<=360000; i++)
        psum[i] += psum[i-1];
    
    for (int i=1; i<=360000; i++)
        psum[i] += psum[i-1];
    
    for (int i=adv_time; i<=360000; i++) {
        long long time;
        if ((time = psum[i-1] - psum[i-adv_time-1]) > mxTime) {
            mxTime = time;
            ans = toHMS(i-adv_time);
        }
    }
    
    return ans;
}