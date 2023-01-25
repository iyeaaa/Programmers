#include <string>
#include <vector>
#include <algorithm>
#include <iostream>
using namespace std;
typedef long long ll;

string tree;
int n;
vector<int> rtn;

bool isAllZero(int lo, int hi) {
    for (int i=lo; i<=hi; i++)
        if (tree[i] != '0')
            return false;
    return true;
}

bool isBinaryTree(int lo, int hi) {
    if (lo == hi) return true;
    int mid = (lo+hi)>>1;
    if (tree[mid] == '0') {
        if (!isAllZero(lo, mid-1) || !isAllZero(mid+1,hi))
            return false;
    } else {
        if (!isBinaryTree(lo,mid-1) || !isBinaryTree(mid+1,hi))
            return false;
    }
    return true;
}

string toBinary(ll n) {
    string rtn = "";

    while (n != 0) {
        rtn += n%2+'0', n /= 2;
    }

    ll len = 1;
    while (len <= rtn.size())
        len *= 2;
    len -= 1;
    len -= rtn.size();

    while (len--) rtn += '0';
    reverse(rtn.begin(), rtn.end());

    return rtn;
}

vector<int> solution(vector<long long> numbers) {
    for (ll v: numbers) {
        tree = toBinary(v);
        n = tree.size();
        if (n%2 == 0 || tree[n/2]=='0') {
            rtn.push_back(0);
            continue;
        }
        rtn.push_back(isBinaryTree(0, n-1));
    }
    return rtn;
}