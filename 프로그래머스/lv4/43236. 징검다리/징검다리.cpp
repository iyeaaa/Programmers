#include <string>
#include <vector>
#include <algorithm>
using namespace std;

bool isPsb(int x, int cnt, vector<int> dist) {
    for (int i=0; i<dist.size()-1; i++) if (dist[i] < x) {
        cnt--;
        dist[i+1] += dist[i];
    }
    return cnt >= 0 && dist.back() >= x;
}

vector<int> findDist(vector<int>& rocks, int distance) {
    vector<int> dist;
    rocks.push_back(distance);
    int cur = 0;
    for (int v: rocks) dist.push_back(v-cur), cur=v;
    return dist;
}

int solution(int distance, vector<int> rocks, int n) {
    sort(begin(rocks), end(rocks));
    vector<int> dist = findDist(rocks, distance);
    int lo=-1, hi=distance+1;
    while (lo+1 < hi) {
        int mid = (lo+hi) >> 1;
        if (isPsb(mid, n, dist)) lo=mid;
        else hi=mid;
    }
    return lo;
}


// 0, 2, 11, 14, 17, 21, 25
// 2, 9, 3, 3, 4, 4