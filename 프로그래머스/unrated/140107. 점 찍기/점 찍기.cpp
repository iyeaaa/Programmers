#include <string>
#include <vector>
#include <cmath>
using namespace std;

long long ans;

long long solution(int k, int td) {
    long long d = td;
    for (long long a=0; a*a <= d*d; a+=k) {
        ans += ((long long)sqrt(d*d - a*a)) / k + 1;
    }
    return ans;
}