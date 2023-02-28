#include <string>
#include <vector>
#include <tuple>
#include <algorithm>
#include <iostream>
#define all(x) (x).begin(), (x).end()
using namespace std;
typedef tuple<int, int> tii;

// 0. 모든 nodeinfo에 노드 번호 삽입
// 1. x기준 오름차순으로 노드 정렬
// 2. x기준으로 자신보다 큰 y 노드 기준으로 작은 y노드를 부모로 선택
// 3. 트리 생성 후 순회

int root;
vector<int> tree[10005];
vector<int> pre, post;

void preorder(int cur) {
    pre.push_back(cur);
    for (int nxt: tree[cur])
        preorder(nxt);
}

void postorder(int cur) {
    for (int nxt: tree[cur])
        postorder(nxt);
    post.push_back(cur);
}

vector<vector<int>> solution(vector<vector<int>> nodeinfo) {
    for (int i=0; i<nodeinfo.size(); i++)
        nodeinfo[i].push_back(i+1);

    sort(all(nodeinfo));
            
    for (int i=0; i<nodeinfo.size(); i++) {
        int lo = -1, hi = -1;
        int loy = 100001, hiy = 100001;
        
        for (int j=i-1; j>=0; j--)
            if (nodeinfo[j][1] > nodeinfo[i][1]) {
                lo = nodeinfo[j][2], loy = nodeinfo[j][1];
                break;
            }
        
        for (int j=i+1; j<nodeinfo.size(); j++)
            if (nodeinfo[j][1] > nodeinfo[i][1]) {
                hi = nodeinfo[j][2], hiy = nodeinfo[j][1];
                break;
            }
        
        if (loy == hiy && hiy == 100001) {
            root = nodeinfo[i][2];
            continue;
        }
        
        if (loy < hiy) tree[lo].push_back(nodeinfo[i][2]);
        else tree[hi].push_back(nodeinfo[i][2]);
    }
    // cout << root << '\n';
    // for (int i=1; i<=9; i++) {
    //     for (int j: tree[i])
    //          cout << i << ' ' << j << ' ';
    //     cout << '\n';
    // }
    
    preorder(root);
    postorder(root);
    
    return {pre, post};
}