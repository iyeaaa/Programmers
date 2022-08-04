/**
* 메모리: 2916 KB, 시간: 16 ms
* 2022.08.04
* by Alub
*/
#include <iostream>
#include <queue>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int N; cin >> N;
    priority_queue<int, vector<int>, less<int> > q;

    for(int i = 0; i < N; i++) {
        int x; cin >> x;
        if(x != 0) {
            q.push(x);
        } else {
            if(q.empty()) {
                cout << 0 << '\n';
            } else {
                cout << q.top() << '\n';
                q.pop();
            }
        }
    }
}