/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.03
* by Alub
*/
#include <iostream>
#include <vector>

using namespace std;

struct Balloon {
    int index;
    int paper;
};

int fixPoint(int N, int pos) {
    int position = pos;
    while (position < 0) {
        position += N;
    }
    return position % N;
}

int main() {
    int N;
    vector<Balloon> Balloons;

    cin >> N;
    for(int i = 1; i <= N; i++) {
        int x; cin >> x;
        Balloons.push_back(Balloon{i, x});
    }

    Balloon erased = Balloons[0];
    Balloons.erase(Balloons.begin());
    cout << erased.index << ' ';
    int pos = fixPoint(N-1, (erased.paper > 0 ? -1 : 0) + erased.paper);

    while(true) {
        erased = Balloons[pos];
        Balloons.erase(Balloons.begin()+pos);
        cout << erased.index << ' ';
        if(Balloons.empty()) break;
        pos = fixPoint(Balloons.size(), pos+(erased.paper > 0 ? -1 : 0)+erased.paper);
    }
}

