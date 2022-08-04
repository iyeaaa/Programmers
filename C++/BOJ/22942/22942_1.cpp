/**
* 메모리: 11368 KB, 시간: 84 ms
* 2022.08.04
* by Alub
*/
#include <iostream>
#include <vector>
#include <tuple>

using namespace std;

bool cmp(tuple<int, int, int> lhs, tuple<int, int, int> rhs) {
    return get<0>(lhs) < get<0>(rhs);
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int N; cin >> N;
    vector<tuple<int, int, int> > point;

    for(int i = 0; i < N; i++) {
        int x, r; cin >> x >> r;
        point.push_back(make_tuple(x-r, -1, i));
        point.push_back(make_tuple(x+r, 1, i));
    }

    sort(point.begin(), point.end(), cmp);

    vector<tuple<int, int, int> > stack;
    string result = "YES";
    for(int i = 0; i < point.size(); i++) {
        if(get<1>(point[i]) == -1) {
            stack.push_back(point[i]);
        } else {
            if(get<2>(stack.back()) != get<2>(point[i])) {
                result = "NO"; break;
            }
            stack.pop_back();
        }
    }

    cout << result;
}