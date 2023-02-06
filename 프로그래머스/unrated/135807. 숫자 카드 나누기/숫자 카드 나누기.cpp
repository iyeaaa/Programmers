#include <string>
#include <vector>
#include <algorithm>
using namespace std;

vector<int> dvsA;
vector<int> dvsB;
int ans1, ans2;

int gcd(int y, int x) {
    return x==0 ? y : gcd(x, y%x);
}

int gcd(const vector<int>& array) {
    int f = array.front();
    for (int v: array)
        f = gcd(f, v);
    return f;
}

void findDivisor(int number, vector<int>& array) {
    array.push_back(number);
    for (int i=2; i*i<number; i++)
        if (number%i == 0)
            array.push_back(i),
            array.push_back(number/i);
}

bool isNotDivided(int x, const vector<int>& array) {
    for (auto v: array)
        if (v % x == 0)
            return false;
    return true;
}

int solution(vector<int> arrayA, vector<int> arrayB) {
    findDivisor(gcd(arrayA), dvsA);
    findDivisor(gcd(arrayB), dvsB);
    
    sort(dvsA.begin(), dvsA.end(), greater<int>());
    sort(dvsB.begin(), dvsB.end(), greater<int>());
    
    for (int v: dvsA)
        if (isNotDivided(v, arrayB)) {
            ans1 = v; break;
        }
    
    for (int v: dvsB)
        if (isNotDivided(v, arrayA)) {
            ans2 = v; break;
        }
    
    return max(ans1, ans2);
}