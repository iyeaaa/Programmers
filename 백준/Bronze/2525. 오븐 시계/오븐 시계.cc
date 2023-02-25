#include <iostream>
using namespace std;

int A, B, C;

int main() {
    cin >> A >> B >> C;
    
    B += C;
    A += B / 60;
    B %= 60;
    A %= 24;
    
    cout << A << ' ' << B;
}