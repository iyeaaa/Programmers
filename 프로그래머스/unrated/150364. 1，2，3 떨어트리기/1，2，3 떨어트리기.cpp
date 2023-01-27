#include <string>
#include <vector>
#include <algorithm>
#include <iostream>
using namespace std;

vector<int> tree[101], cnts(101), order, ans;
int idx[101];
int n;

void dropCnt(int node) {
    // is Leaf Node (base case)
    if (tree[node].empty()) {
        cnts[node]++;
        order.push_back(node);
        return;
    }

    // is Internal Node (recusion case)
    dropCnt(tree[node][idx[node]++]);

    // if child node is last node
    if (idx[node] == tree[node].size())
        idx[node] = 0;
}

int isPsb(const vector<int>& target) {
    for (int i=1; i<=n; i++) {
        // Can't make answer
        if (cnts[i] > target[i-1])
            return -1;

        // yet impossible
        if (cnts[i]*3 < target[i-1])
            return 0;
    }
    // possible
    return 1;
}

vector<int> solution(vector<vector<int>> edges, vector<int> target) {
    // making Tree
    for (auto v: edges) {
        tree[v[0]].push_back(v[1]);
        n = max(n, max(v[0], v[1]));
    }
    for (auto& v: tree)
        sort(v.begin(), v.end());

    // checking Possibility
    while (true) {
        int isPossible = isPsb(target);

        // Can't make answer
        if (isPossible == -1)
            return {-1};

        // isPossible
        if (isPossible == 1)
            break;

        // yet impossible
        dropCnt(1);
    }

    // determine Number
    for (int i=0; i<order.size(); i++) {
        int node = order[i];
        int& cnt = cnts[node];
        for (int j=1; j<=3; j++) {
            if ((cnt-1)*3 >= target[node-1]-j) {
                ans.push_back(j);
                cnt -= 1;
                target[node-1] -= j;
                break;
            }
        }
    }

    return ans;
}