/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.16
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int N, K;
int list[101];
vector<int> mt;

int maxIdx(int idx) {
    int maxValue = -1;
    int maxIdx = 0;
    for (int i = 0; i < N; i++) {
        for (int j = idx + 1; j <= K; j++) {
            if (j == K) {
                return i;
            }
            if (list[j] == mt[i]) {
                if (maxValue < j) {
                    maxValue = j;
                    maxIdx = i;
                }
                break;
            }
        }
    }
    return maxIdx;
}

bool contains(int x) {
    return find(mt.begin(), mt.end(), x) != mt.end();
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N >> K;

    for (int i = 0; i < K; i++)
        cin >> list[i];

    int count = 0;
    for (int i = 0; i < K; i++) {
        int x = list[i];
        if (contains(x))
            continue;
        if (mt.size() < N)
            mt.push_back(x);
        else {
            mt[maxIdx(i)] = x;
            count++;
        }
    }

    cout << count << endl;
}
