
#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
using namespace std;

int L, C, N, M;
vector<char> pnt, chl;
vector<string> ans;

void chlC(int idx, string x) {
    if (x.size() == L) {
        sort(x.begin(), x.end());
        ans.push_back(x); return;
    }
    if (idx == M) return;
    for (int i=idx; i<M; i++) chlC(i+1, x+chl[i]);
}

void pntC(int idx, string x) {
    if (x.size() >= 1) chlC(0, x);
    if (idx == N || x.size() >= L-2) return;
    for (int i=idx; i<N; i++) pntC(i+1, x+pnt[i]);
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> L >> C;
    for (int i=0; i<C; i++) {
        char x; cin >> x;
        if (x=='a' || x=='e' || x=='i' || x=='o' || x=='u')
            pnt.push_back(x);
        else
            chl.push_back(x);
    }
    N = pnt.size(), M = chl.size();

    pntC(0, {});
    sort(ans.begin(), ans.end());

    for (string v: ans) cout << v << '\n';
}