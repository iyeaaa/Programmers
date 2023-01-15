
#include <iostream>
#include <algorithm>
#include <vector>
#include <cmath>
using namespace std;

int A, B, m, x, ten;
vector<int> ans;

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> A >> B >> m;
    for (int i=m-1; i>=0; i--) cin>>x, ten+=pow(A,i)*x;

    while (ten != 0)
        ans.push_back(ten%B), ten/=B;

    for (int i=ans.size()-1; i>=0; i--)
        cout << ans[i] << ' ';
}