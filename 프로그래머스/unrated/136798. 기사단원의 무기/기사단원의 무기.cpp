#include <string>
#include <vector>
using namespace std;

const int MAX = 100'005;
int cnt[MAX];
int ans;

int solution(int number, int limit, int power) {
    for (int i=1; i<=number; i++)
        for (int j=i; j<=number; j+=i)
            cnt[j]++;
    
    for (int i=1; i<=number; i++)
        ans += cnt[i] <= limit ? cnt[i] : power;
    
    return ans;
}