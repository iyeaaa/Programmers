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

    for (const string& v: in) {
        istringstream ss(v);
        vector<string> temp(4);
        int score = 0;
        ss >> temp[0] >> temp[1] >> temp[2] >> temp[3] >> score;
        C("", 0, score, temp);
    }

    for (auto& [k, v]: info)
        sort(v.begin(), v.end());

    for (const string& v: query) {
        vector<string> temp(5);
        string k;
        istringstream ss(v);
        int value = 0;
        
        ss >> temp[0] >> k >> temp[1] >> k >> temp[2] >> k >> temp[3];
        ss >> value;
        
        string key = temp[0] + temp[1] + temp[2] + temp[3];

        auto l = lower_bound(info[key].begin(), info[key].end(), value) - info[key].begin();
        answer.push_back(info[key].size() - l);
    }

    return answer;
}