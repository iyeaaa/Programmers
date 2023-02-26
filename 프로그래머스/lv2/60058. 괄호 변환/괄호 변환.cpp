#include <string>
#include <vector>
#include <iostream>
using namespace std;

bool isRight(const string& s) {
    int cnt = 0;
    for (char c: s) {
        if (c == '(') cnt++;
        else cnt--;
        if (cnt < 0) return false;
    }
    return cnt == 0;
}

string solution(string w) {
    if (w.empty())
        return "";

    string u = "", v = "";

    int lo = 0, hi = 0;

    for (int i=0; i<w.size(); i++) {
        if (w[i] == '(') lo++;
        else hi++;
        u.push_back(w[i]);
        if (lo == hi) {
            v = w.substr(i+1);
            break;
        }
    }

    if (isRight(u)) {
        return u + solution(v);
    }

    u.erase(u.begin());
    u.pop_back();

    for (char & i : u) {
        if (i == '(') i = ')';
        else i = '(';
    }

    return '(' + solution(v) + ')' + u;
}