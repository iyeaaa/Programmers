#include <iostream>
using namespace std;

int n;
int tree[4000005];

int pop(int node, int lo, int hi, int rank) {
    if (lo == hi) {
        tree[node] -= 1;
        return lo;
    }

    int rtn, mid = (lo+hi)>>1;
    if (rank <= tree[node*2])
        rtn = pop(node*2, lo, mid, rank);
    else
        rtn = pop(node*2+1, mid + 1, hi, rank-tree[node*2]);

    tree[node]--;

    return rtn;
}

void update(int node, int lo, int hi, int taste, int cnt) {
    if (lo == hi) {
        tree[node] += cnt;
        return;
    }

    int mid = (lo+hi) >> 1;
    if (taste <= mid)
        update(node*2, lo, mid, taste, cnt);
    else
        update(node*2+1, mid + 1, hi, taste, cnt);

    tree[node] = tree[node*2] + tree[node*2+1];
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
    cin >> n;
    int A, B, C;

    while (n--) {
        cin >> A >> B;
        if (A == 1) {
            cout << pop(1, 1, 1000000, B) << '\n';
        } else {
            cin >> C;
            update(1, 1, 1000000, B, C);
        }
    }
}

