/**
* 메모리: 1228 KB, 시간: 4 ms
* 2022.08.22
* by Alub
*/
#include <cstdio>
#include <vector>
using namespace std;


vector<int> findFibo(int n) {
    vector<int> fibo;
    fibo.push_back(0);
    fibo.push_back(1);
    int i = 2;
    int next = fibo[i-1] + fibo[i-2];
    while (next <= n) {
        fibo.push_back(next);
        i++, next = fibo[i-1]+fibo[i-2];
    }
    return fibo;
}

void solve() {
    int n; scanf("%d", &n);
    vector<int> result;
    vector<int> fibo = findFibo(n);
    for (int i = fibo.size()-1; i >= 0; i--) {
        if (fibo[i] <= n) {
            result.push_back(fibo[i]);
            n -= fibo[i];
        }
        if (n == 0)
            break;
    }
    for (int i = result.size()-1; i >= 0; i--)
        printf("%d ", result[i]);
    printf("\n");
}

int main() {
    int T;
    scanf("%d", &T);
    while(T--) solve();
}
