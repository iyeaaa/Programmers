#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int col, ans;

bool cmp(const vector<int>& a, const vector<int>& b) {
    return a[col] != b[col] ? a[col] < b[col] : a[0] > b[0];
}

int solution(vector<vector<int>> data, int tcol, int row_begin, int row_end) {
    col = tcol-1;
    sort(data.begin(), data.end(), cmp);
    
    for (int i=row_begin-1; i<row_end; i++) {
        int mod = 0;
        for (auto v: data[i])
            mod += v % (i+1);
        ans ^= mod;
    }
    
    return ans;
}