#include <string>
#include <vector>
#include <unordered_map>
#include <iostream>
#include <sstream>
#include <algorithm>
using namespace std;

unordered_map<string, vector<int>> info;
vector<vector<string>> infovector;
int n;
vector<int> answer;

bool cmp(const vector<string>& a, const vector<string>& b) {
    return stoi(a[4]) < stoi(b[4]);
}

vector<string> split(const string& s, char d) {
    vector<string> rtn;
    istringstream ss(s);
    string buffer;

    while (getline(ss, buffer, d))
        rtn.push_back(buffer);

    return rtn;
}

void C(string cur, int idx, int score, const vector<string>& q) {
    if (idx == 4) {
        info[cur].push_back(score);
        return;
    }
    C(cur + "-", idx+1, score, q);
    C(cur + q[idx], idx+1, score, q);
}

vector<int> solution(vector<string> in, vector<string> query) {
    n = in.size();

    for (const string& v: in)
        infovector.push_back(split(v, ' '));

    sort(infovector.begin(), infovector.end(), cmp);

    for (const vector<string>& temp: infovector) {
        int score = stoi(temp[4]);
        C("", 0, score, temp);
    }

    for (const string& v: query) {
        vector<string> temp = split(v, ' ');
        string key = temp[0] + temp[2] + temp[4] + temp[6];
        int value = stoi(temp[7]);

        auto l = lower_bound(info[key].begin(), info[key].end(), value) - info[key].begin();
        answer.push_back(info[key].size() - l);
    }

    return answer;
}