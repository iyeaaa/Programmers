#include <string>
#include <vector>
#include <unordered_set>
using namespace std;

int N;
unordered_set<int> s;

int solution(vector<int> elements) {
    N = elements.size();
    
    for (int i=0; i<N; i++) {
        int sum = 0;
        for (int j=i; j<i+N; j++) {
            sum += elements[j%N];
            s.insert(sum);
        }
    }
            
    return s.size();
}