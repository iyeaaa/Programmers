/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.02
* by Alub
*/
#include <iostream>
using namespace std;

int main() {
    int a, b, c, d, e, f;
    cin >> a >> b >> c >> d >> e >> f;

    for(int x = -999; x < 1000; x++) {
        for(int y = -999; y < 1000; y++) {
            if (a * x + b * y == c && d * x + e * y == f) {
                cout << x << " " << y;
                return 0;
            }
        }
    }
}