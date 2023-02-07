#include <string>
#include <vector>
using namespace std;

int result;

int solution(int a, int b, int n) {
    while (n >= a) {
        result += n/a*b;
        n = n/a*b + n%a;
    }
    return result;
}