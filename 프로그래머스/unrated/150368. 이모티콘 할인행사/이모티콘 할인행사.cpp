#include <string>
#include <vector>
using namespace std;

vector<vector<int>> U;
vector<int> E, sales;
int n, m;
pair<int, int> result;

void f() {
    pair<int, int> info = {0, 0};
    for (auto v: U) {
        int byS = v[0], mx = v[1];
        int sum = 0;
        for (int i=0; i<m; i++)
            if (byS <= sales[i])
                sum += E[i]*(100-sales[i])/100;
        if (sum >= mx) info.first++;
        else info.second += sum;
    }
    result = max(result, info);
}

void C(int idx) {
    if (idx == m) {
        f(); return;
    }
    for (int i=10; i<=40; i+=10) {
        sales.push_back(i);
        C(idx+1);
        sales.pop_back();
    }
}

vector<int> solution(vector<vector<int>> tU, vector<int> tE) {
    U = tU, E = tE;
    n = U.size(), m = E.size();
    C(0);
    return {result.first, result.second};
}