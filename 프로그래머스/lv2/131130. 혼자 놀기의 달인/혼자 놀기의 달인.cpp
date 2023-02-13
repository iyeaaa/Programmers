#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int ans = 0;
vector<int> cycles(2);
vector<bool> v(101);

int cycle(int node, const vector<int>& cards) {
    if (v[node])
        return 0;
    v[node] = true;
    return 1 + cycle(cards[node], cards);
}

int solution(vector<int> cards) {
    cards.insert(cards.begin(), 0);
    for (int i=1; i<cards.size(); i++)
        if (!v[i])
            cycles.push_back(cycle(i, cards));
    sort(cycles.begin(), cycles.end(), greater<int>());
    return cycles[0] * cycles[1];
}