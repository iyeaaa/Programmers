#include <iostream>
#include <string>
using namespace std;

string x;

string sum(const string& s) {
    int rtn = 0;
    for (char c: s)
        rtn += c - '0';
    return to_string(rtn);
}

int main() {
    cin >> x;
    int cnt = 0;
    while (x.size() > 1)
        cnt++, x = sum(x);
    cout << cnt;
    cout << '\n';
    cout << ((x.front()-'0') % 3 == 0 ? "YES" : "NO");
}