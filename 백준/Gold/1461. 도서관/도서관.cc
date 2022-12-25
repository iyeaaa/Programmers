
#include <algorithm>
#include <iostream>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N, M; cin >> N >> M;
    int P[N]; for(int i = 0; i < N; i++) cin >> P[i];
    sort(P, P + N);

    int sum = 0;
    for(int i = 0; i<N && P[i]<0; i+=M)
        sum -= 2*P[i];
    for(int i = N-1; i>=0 && P[i]>0; i-=M)
        sum += 2*P[i];

    cout << sum - max(-1*P[0], P[N-1]);
}