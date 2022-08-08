/**
* 메모리: 12388 KB, 시간: 188 ms
* 2022.08.08
* by Alub
*/
#include <iostream>
#include <queue>

using namespace std;

typedef pair<int, int> pr;
typedef long long int lli;

struct cmp {
    bool operator()(pr &a, pr &b) {
        return a.second != b.second ? a.second < b.second : a.first > b.first;
    }   // 가격은 내림차순, 무게는 오름차순
};

bool compare(const pr &a, const pr &b) {
    return a.first > b.first;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int N, K; cin >> N >> K;
    priority_queue<pr, vector<pr>, cmp> pq;
    vector<pr> ruby;
    vector<int> bag;

    while(N--) {
        int M, V; cin >> M >> V;
        ruby.push_back({M, V});
    }
    sort(ruby.begin(), ruby.end(), compare);

    while(K--) { int x; cin >> x; bag.push_back(x); }
    sort(bag.begin(), bag.end());

    lli sum = 0;
    for(int i = 0; i < bag.size(); i++) {
        while(!ruby.empty() && ruby.back().first <= bag[i]) {
            pq.push(ruby.back());
            ruby.pop_back();
        }

        if(pq.empty()) continue;
        sum += pq.top().second;
        pq.pop();
    }

    cout << sum;
}