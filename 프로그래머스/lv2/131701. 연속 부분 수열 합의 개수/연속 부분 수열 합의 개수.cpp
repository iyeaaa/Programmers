#include <string>
#include <vector>
#include <unordered_set>
using namespace std;

int N;
unordered_set<int> s;

int solution(vector<int> elements) {
    N = elements.size();
    
    for (int len=1; len<=N; len++) {
        int sum = 0;
        for (int i=0; i<len; i++)
            sum += elements[i];
        
        s.insert(sum);
        for (int i=0, j=len; i<N; i++,j++) {
            sum += elements[j%N];
            sum -= elements[(j-len)%N];
            s.insert(sum);
        }
    }
            
    return s.size();
}