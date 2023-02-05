#include <string>
#include <vector>
#include <queue>
using namespace std;

priority_queue<int, vector<int>, greater<int>> pq;
vector<int> ans;

vector<int> solution(int k, vector<int> score) {
    for (auto v: score) {
        pq.push(v);
        if (pq.size() > k)
            pq.pop();
        ans.push_back(pq.top());
    }
    return ans;
}