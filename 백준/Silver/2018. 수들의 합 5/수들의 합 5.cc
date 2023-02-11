#include <iostream>
using namespace std;

int N;
int lo=0, hi=1;
int sum = 1;
int ans = 0;

int main() {
    cin >> N;
    while (lo < hi) {
        if (sum < N) {
            sum += ++hi;
        } else if (sum > N) {
            sum -= ++lo;
        } else {
            ans++;
            sum += ++hi;
        }
    }
    cout << ans;
}

