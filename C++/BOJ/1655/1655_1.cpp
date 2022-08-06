/**
* 메모리: 2792 KB, 시간: 24 ms
* 2022.08.06
* by Alub
*/
#include <iostream>
#include <queue>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int N; cin >> N;
    priority_queue<int, vector<int>, greater<int>> minHeap;
    priority_queue<int, vector<int>, less<int>> maxHeap;
    int first; cin >> first; maxHeap.push(first);
    cout << first << '\n'; N--;

    while(N--) {
        int x; cin >> x;

        if(minHeap.size() == maxHeap.size()) {
            if(x > minHeap.top()) {
                maxHeap.push(minHeap.top());
                minHeap.pop();
                minHeap.push(x);
            } else
                maxHeap.push(x);
        } else {
            if(x >= maxHeap.top())
                minHeap.push(x);
            else {
                minHeap.push(maxHeap.top());
                maxHeap.pop();
                maxHeap.push(x);
            }
        }

        cout << maxHeap.top() << '\n';
    }

}