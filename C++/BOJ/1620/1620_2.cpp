/**
* 메모리: 20736 KB, 시간: 188 ms
* 2022.08.04
* by Alub
*/
#include <iostream>
#include <vector>
#include <map>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int N, M; cin >> N >> M;
    map<string, int> nameToNum;
    string numToName[100001];

    for(int i = 1; i <= N; i++) {
        string name; cin >> name;
        nameToNum[name] = i;
        numToName[i] = name;
    }

    for(int i = 1; i <= M; i++) {
        string x; cin >> x;
        if(isdigit(x[0])) {
            cout << numToName[stoi(x)] << '\n';
        } else {
            cout << nameToNum[x] << '\n';
        }
    }
}