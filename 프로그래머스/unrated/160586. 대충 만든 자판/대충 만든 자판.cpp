#include <string>
#include <vector>
#include <iostream>

using namespace std;
vector<int> ans;

vector<int> solution(vector<string> keymap, vector<string> targets) {
    for (string target: targets) {
        int cnt = 0;
        for (char c: target) {
            int mnCnt = 99999999;
            for (string k: keymap) {
                int pos = k.find(c);
                mnCnt = min(mnCnt, pos == -1 ? 999999 : pos+1);
            }
            cnt += mnCnt;
        }
        cout << '\n';
        ans.push_back(cnt > 99999 ? -1 : cnt);
    }
    return ans;
}