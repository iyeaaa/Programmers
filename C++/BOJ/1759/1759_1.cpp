/**
* 메모리: 2160 KB, 시간: 4 ms
* 2022.09.01
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
#include <set>
using namespace std;

int L, C; char x;
vector<char> prnt, child;
set<string> answer;

void dfs(int pCnt, int cCnt, int pIdx, int cIdx, string cur) {
    if (pCnt + cCnt < L) {
        if (pCnt < 1) {
            for (int i = pIdx; i < prnt.size(); i++) {
                cur.push_back(prnt[i]);
                dfs(pCnt+1, cCnt, i+1, cIdx, cur);
                cur.pop_back();
            }
        } else if (cCnt < 2) {
            for (int i = cIdx; i < child.size(); i++) {
                cur.push_back(child[i]);
                dfs(pCnt, cCnt+1, pIdx, i+1, cur);
                cur.pop_back();
            }
        } else {// a c s t
            for (int i = pIdx; i < prnt.size(); i++) {
                cur.push_back(prnt[i]);
                dfs(pCnt+1, cCnt, i+1, cIdx, cur);
                cur.pop_back();
            }
            for (int i = cIdx; i < child.size(); i++) {
                cur.push_back(child[i]);
                dfs(pCnt, cCnt+1, pIdx, i+1, cur);
                cur.pop_back();
            }
        }
    } else {
        sort(cur.begin(), cur.end());
        answer.insert(cur);
    }
}

void solve() {
    string s;
    dfs(0, 0, 0, 0, s);
    for (string emt: answer)
        cout << emt << endl;
}

void input() {
    cin >> L >> C;
    for (int i = 0; i < C; i++) {
        cin >> x;
        if (x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u')
            prnt.push_back(x);
        else
            child.push_back(x);
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
