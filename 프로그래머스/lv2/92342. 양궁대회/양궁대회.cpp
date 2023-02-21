#include <string>
#include <vector>
using namespace std;

vector<int> lian, peach;
int mxDiff = -99;
vector<int> result(11, -99);

// O(1)
bool isBetter(const vector<int>& a, const vector<int>& b) {
    for (int i=10; i>=0; i--)
        if (a[i] != b[i])
            return a[i] > b[i];
    return false;
}

// O(1)
int findScoreDiff() {
    int lianScore = 0;
    int peachScore = 0;
    
    for (int i=0; i<=10; i++) {
        int score = 10-i;
        if (lian[i] == peach[i] && peach[i] == 0)
            continue;
        if (lian[i] > peach[i])
            lianScore += score;
        else
            peachScore += score;
    }
    
    return lianScore - peachScore;
}

// O(10Hn)
void C(int idx, int save) {
    if (idx == 11) {
        int scoreDiff = findScoreDiff();
        if (mxDiff < scoreDiff || mxDiff == scoreDiff && isBetter(lian, result))
            result = lian, mxDiff = scoreDiff;
        return;
    }
    for (int i=0; i<=save; i++) {
        lian.push_back(i);
        C(idx+1, save-i);
        lian.pop_back();
    }
}

vector<int> solution(int n, vector<int> info) {
    peach = info;
    C(0, n);
    
    if (mxDiff <= 0)
        return {-1};
    
    return result;
}