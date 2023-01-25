#include <string>
#include <iostream>
#include <vector>
#include <tuple>
#include <algorithm>
#include <sstream>
using namespace std;
typedef tuple<int, int, int> ti;

int terms[26];
vector<pair<ti, int>> privacies;
vector<int> ans;

void change(ti& date) {
    auto& [y, m, d] = date;
    if (d % 28 == 0) {
        m += (d / 28) - 1;
        d = 28;
    } else {
        m += (d / 28);
        d %= 28;
    }
    if (m % 12 == 0) {
        y += (m / 12) - 1;
        m = 12;
    } else {
        y += m/12;
        m %= 12;
    }
}

ti getTuple(string str) {
    istringstream iss(str);
    string buffer;
    ti date = {0, 0, 0};
    vector<int> rtn;

    while (getline(iss, buffer, '.'))
        rtn.push_back(stoi(buffer));

    date = {rtn[0], rtn[1], rtn[2]};
    return date;
}

vector<int> solution(string ttoday, vector<string> tterms, vector<string> tprivacies) {
    ti today = getTuple(ttoday);

    for (string v: tterms)
        terms[v[0]-'A'] = stoi(v.substr(2));

    for (int i=1; i<= tprivacies.size(); i++) {
        string v = tprivacies[i-1];
        int term = terms[v.back()-'A'];
        ti date = getTuple(v.substr(0, 10));
        get<2>(date) += term*28-1;
        change(date);
        if (today > date)
            ans.push_back(i);
    }

    return ans;
}