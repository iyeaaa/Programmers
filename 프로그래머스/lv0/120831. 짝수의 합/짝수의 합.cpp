#include <string>
#include <vector>

using namespace std;

int solution(int n) {
    return n%2==1 ? solution(n-1) : n<1 ? 0 : n+solution(n-2);
}