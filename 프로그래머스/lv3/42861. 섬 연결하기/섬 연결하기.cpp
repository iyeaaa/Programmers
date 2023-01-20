#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

bool cmp(const vector<int>& a, const vector<int>& b) {
    return a[2] < b[2];
}

class Disjoint_Set {
    int parent[101], rank[101];

public:
    Disjoint_Set() {
        for (int i=0; i<=100; i++) parent[i]=i, rank[i]=1;
    }

    int root(int x) {
        if (x == parent[x]) return x;
        return parent[x] = root(parent[x]);
    }

    void uni(int x, int y) {
        x = root(x), y = root(y);
        if (rank[x] > rank[y]) parent[y] = x;
        else parent[x] = y;
        if (rank[x] == rank[y]) rank[y]++;
    }

    bool isUni(int x, int y) {
        return root(x) == root(y);
    }
};

int solution(int n, vector<vector<int>> costs) {
    Disjoint_Set uf = Disjoint_Set();
    sort(begin(costs), end(costs), cmp);
    int ans = 0;

    for (auto v: costs) {
        int a = v[0], b = v[1], c = v[2];
        if (uf.isUni(a, b)) continue;
        ans += c;
        uf.uni(a, b);
    }

    return ans;
}
