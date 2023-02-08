#include <iostream>
#include <algorithm>
#include <vector>
#include <cmath>
#define FIO ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
using namespace std;
typedef long long ll;

/*
 N: 가지고 있는 1L 물병의 수
 K: 마지막에 가지고 있어야 하는 물병의 최댓값
 h: 초기에 가진 물병으로 만들 수 있는 물병의 높이 벡터
 */
ll N, K, ans;
vector<int> heights;

int main() {
    FIO
    cin >> N >> K;

    int cnt = 0;
    do {
        ll b = N;
        cnt = 0;
        while (b > 0)
            cnt+=b%2, b/=2;
        N++; ans++;
    } while (cnt > K);

    cout << --ans;
}
