/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.09.05
* by Alub
*/
#include <iostream>
#include <queue>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    string A, B;
    cin >> A >> B;

    int minValue = 99999999;
    for (int i = 0; i <= B.size()-A.size(); i++) {
        int diff = 0;
        for (int j = 0; j < A.size(); j++)
            if (A[j] != B[i+j])
                diff++;
        minValue = min(minValue, diff);
    }

    cout << minValue << endl;
}