/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.17
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    for (int i = 1000; i <= 9999; i++) {
        int ten = 0;
        int twlv = 0;
        int six = 0;

        for (int j = i; j > 0; j/=10)
            ten += j%10;
        for (int j = i; j > 0; j/=12)
            twlv += j%12;
        for (int j = i; j > 0; j/=16)
            six += j%16;

        if (ten == twlv && twlv == six)
            cout << i << '\n';
    }
}