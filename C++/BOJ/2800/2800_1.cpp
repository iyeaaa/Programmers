/**
* 메모리: 2164 KB, 시간: 0 ms
* 2022.08.03
* by Alub
*/
#include <iostream>
#include <vector>
#include <set>

using namespace std;

void dfs(int cur, int digit, string strn, vector<pair<int, int> > bracket, set<string> &result) {
    if(digit == bracket.size()) {
        strn.erase(remove(strn.begin(), strn.end(), ' '), strn.end());
        result.insert(strn);
        return;
    }
    int first = bracket[cur].first;
    int second = bracket[cur].second;
    dfs(cur+1, digit+1, strn, bracket, result);
    strn[first] = ' '; strn[second] = ' ';
    dfs(cur+1, digit+1, strn, bracket, result);
}

int main() {
    string strn; cin >> strn;
    vector<int> idx;
    vector<pair<int, int> > bracket;
    set<string> result;
    for(int i = 0; i < strn.size(); i++) {
        if(strn[i] == '(')
            idx.push_back(i);
        else if(strn[i] == ')') {
            bracket.push_back(make_pair(idx.back(), i));
            idx.pop_back();
        }
    }

    dfs(0, 0, strn, bracket, result);

    for(auto it = result.begin(); it != result.end(); it++) {
        if(strn == *it) { continue; }
        cout << *it << '\n';
    }
}