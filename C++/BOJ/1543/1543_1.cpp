/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.15
* by Alub
*/
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    string strn;
    string find;

    getline(cin, strn);
    getline(cin, find);

    if(find.size() > strn.size()) {
        cout << 0; return 0;
    }

    int count = 0;
    for(int i = 0; i <= strn.size()-find.size(); i++) {
        if(find == strn.substr(i, find.size())) {
            count += 1;
            i += find.size()-1;
        }
    }

    cout << count;
}