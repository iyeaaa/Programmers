/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.25
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N, S;
vector<int> list(51);

bool oper(const int& a, const int& b) {
    return list[a] < list[b];
}

vector<int> sorted(int stt) {
    vector<int> idx;
    for (int i = stt; i < N; i++) if (list[i] > list[stt-1]) {
        idx.push_back(i);
    }
    sort(idx.begin(), idx.end(), oper);
    return idx;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> list[i];
    cin >> S;

    for (int i = 0; i < N-1 && S > 0; i++) {
        vector<int> idx = sorted(i+1);
        for (int j = idx.size()-1; j >= 0; j--) if (idx[j]-i <= S) {
            S -= idx[j]-i;
            int removed = list[idx[j]];
            list.erase(list.begin()+idx[j]);
            list.insert(list.begin()+i, removed);
            break;
        }
    }

    for (int i = 0; i < N; i++)
        cout << list[i] << ' ';
}
