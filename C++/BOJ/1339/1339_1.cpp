/**
* 메모리: 2212 KB, 시간: 0 ms
* 2022.08.15
* by Alub
*/
#include <iostream>
#include <vector>
#include <cmath>

using namespace std;
typedef pair<char, int> ci;

int N;
vector<ci> eng(26);
vector<string> list;
char engToNum[26];

bool oper(const ci &a, const ci &b) {
    return a.second > b.second;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    cin >> N;
    fill(&engToNum[0], &engToNum[26], -1);

    for(int i = 0; i < N; i++) {
        string x; cin >> x;
        list.push_back(x);
        for(int j = 0; j < x.size(); j++) {
            eng[x[j]-65].second += pow(10, x.size()-j);
            eng[x[j]-65].first = x[j];
        }
    }

    sort(eng.begin(), eng.end(), oper);

    int maxValue = 9;
    for(auto e: eng) {
        if(engToNum[e.first-65] != -1) continue;
        engToNum[e.first-65] = 48+maxValue--;
    }

    int sum = 0;
    for(int i = 0; i < list.size(); i++) {
        for (int j = 0; j < list[i].size(); j++) {
            list[i][j] = engToNum[list[i][j]-65];
        }
        sum += stoi(list[i]);
    }
    cout << sum;
}