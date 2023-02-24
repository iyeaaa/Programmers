#include <string>
#include <vector>
#include <algorithm>
using namespace std;
typedef pair<int, int> pii;

int play_time, adv_time;
vector<pii> event;

string fillup(int time1) {
    string time = to_string(time1);
    while (time.size() < 2)
        time = '0' + time;
    return time;
}

string i2s(int time) {
    string h = fillup(time / 3600);
    time %= 3600;

    string m = fillup(time / 60);
    time %= 60;

    string s = fillup(time);

    return h + ':' + m + ":" + s;
}

int s2i(const string& str, int pos) {
    int rtn = 0;
    rtn += stoi(str.substr(pos, 2)) * 3600;
    rtn += stoi(str.substr(pos+3, 2)) * 60;
    rtn += stoi(str.substr(pos+6, 2));
    return rtn;
}

string solution(string p, string a, vector<string> logs) {
    play_time = s2i(p, 0), adv_time = s2i(a, 0);

    for (const string& log: logs) {
        event.push_back({s2i(log, 0), 1});
        event.push_back({s2i(log, 9), -1});
    }
    event.push_back({0, 0});

    sort(event.begin(), event.end());

    long long curtime = 0, mxtime = 0;
    int curval = 0, mxval = 0;
    int idx1 = 0, idx2 = 0, cnt1 = 0, cnt2 = 0;

    while (idx2+1 < event.size() && event[idx2+1].first <= adv_time) {
        curtime += cnt2 * (event[idx2+1].first - event[idx2].first);
        cnt2 += event[idx2+1].second;
        idx2++;
    }

    curtime += cnt2*(adv_time - event[idx2].first);
    mxtime = curtime;

    while (curval+adv_time <= play_time && idx2+1 < event.size()) {
        int delta1 = event[idx1+1].first - curval;
        int delta2 = event[idx2+1].first - curval - adv_time;
        if (delta1 <= delta2) {
            curtime += 1ll * (cnt2-cnt1) * delta1;
            curval += delta1;
            cnt1 += event[idx1+1].second;
            idx1++;
        } else {
            curtime += 1ll * (cnt2-cnt1) * delta2;
            curval += delta2;
            cnt2 += event[idx2+1].second;
            idx2++;
        }
        if (curtime > mxtime) {
            mxtime = curtime;
            mxval = curval;
        }
    }

    return i2s(mxval);
}
