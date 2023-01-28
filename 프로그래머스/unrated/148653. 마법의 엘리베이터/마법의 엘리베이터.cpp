#include <string>
#include <vector>
using namespace std;

int solution(int x) {
    if (x/10 == 0) return min(x, 10-x+1);
    return min(solution(x/10)+x%10, solution(x/10+1)+10-x%10);
}