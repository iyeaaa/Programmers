#include <string>
#include <vector>
#include <queue>
using namespace std;

priority_queue<int> pq;

int solution(int n, int k, vector<int> enemy) {
    for (int i=1; i<=enemy.size(); i++) {
        int e = enemy[i-1];
        pq.push(e);
        
        while (n-e < 0 && k > 0 && !pq.empty())
            k--, n+=pq.top(), pq.pop();
        
        if (n - e < 0) return i-1;
        else n -= e;
    }
    
    return enemy.size();
}