/**
* 메모리: 2020 KB, 시간: 40 ms
* 2022.09.13
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N, A[12], O[4], maxAns = -1000000001, minAns = 1000000001;

int calculate(vector<int> oper) {
    int result = A[0];
    for (int i = 1; i < N; i++) {
        switch (oper[i-1]) {
            case 0: result += A[i]; break;
            case 1: result -= A[i]; break;
            case 2: result *= A[i]; break;
            default : result /= A[i];
        }
    }
    return result;
}

void dfs(int cnt, vector<int> oper) {
    if (cnt == N-1) {
        int cclted = calculate(oper);
        minAns = min(minAns, cclted);
        maxAns = max(maxAns, cclted);
        return;
    }
    for (int i = 0; i < 4; i++) if (O[i] > 0) {
        O[i] -= 1;
        oper.push_back(i);
        dfs(cnt+1, oper);
        oper.pop_back();
        O[i] += 1;
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> A[i];
    for (int i = 0; i < 4; i++)
        cin >> O[i];

    dfs(0, {});
    cout << maxAns << '\n' << minAns;
}