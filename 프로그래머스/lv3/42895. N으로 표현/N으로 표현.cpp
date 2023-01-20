#include <unordered_set>
using namespace std;

unordered_set<int> s[9];

int solution(int N, int number) {
    int f = N;
    for (int i=1; i<=8; i++)
        s[i].insert(f), f = f*10+N;
    
    if (N == number) return 1;
    
    for (int i=2; i<=8; i++) {
        for (int j=1; j<i; j++) {
            for (int v1: s[i-j])
                for (int v2: s[j]) {
                    s[i].insert(v1+v2),
                    s[i].insert(v1-v2),
                    s[i].insert(v1*v2);
                    if (v2 == 0) continue;
                    s[i].insert(v1/v2);
                }
        }
        if (s[i].find(number) != s[i].end())
            return i;
    }
    
    return -1;
}