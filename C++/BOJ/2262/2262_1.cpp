/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.29
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N, x;
vector<int> A;

int findMaxIdx() {
    int idx = 1;
    for (int i = 2; i < A.size()-1; ++i)
        if (A[idx] < A[i])
            idx = i;
    return idx;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N; A.push_back(99999999);
    for (int i = 0; i < N; i++)
        cin >> x, A.push_back(x);
    A.push_back(99999999);

    int sum = 0;
    while (A.size() > 3) {
        int maxIdx = findMaxIdx();
        sum += min(abs(A[maxIdx]-A[maxIdx-1]), abs(A[maxIdx]-A[maxIdx+1]));
        A.erase(A.begin() + maxIdx);
    }

    cout << sum;
}

