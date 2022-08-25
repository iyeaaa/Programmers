/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.25
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N, M, beads[301];

vector<int> group(int mid) {
    vector<int> result = {0};
    vector<int> fail(M+1);
    int sum = 0;
    for (int i = 0; i < N; i++) {
        if (beads[i] > mid) {
            return fail;
        }
        if (sum + beads[i] > mid) {
            sum = beads[i];
            result.push_back(1);
        } else {
            sum += beads[i];
            result[result.size()-1]++;
        }
    }

    return result;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N >> M;
    for (int i = 0; i < N; i++)
        cin >> beads[i];

    int lf = 1, ryt = 30000;
    vector<int> result;
    while (lf <= ryt) {
        int mid = (lf+ryt)/2;
        vector<int> g = group(mid);
        if (g.size() <= M) {
            ryt = mid - 1;
            result = g;
        } else {
            lf = mid + 1;
        }
    }

    cout << lf << endl;
    int divide = M - result.size();
    for (int i = 0; i < result.size(); i++) {
        while (result[i] >= 2 && divide > 0) {
            divide--, result[i]--;
            cout << 1 << ' ';
        }
        if (result[i] >= 1) {
            cout << result[i] << ' ';
        }
    }
}
