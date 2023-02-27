#include <string>
#include <vector>
#include <set>
#include <tuple>
using namespace std;
typedef vector<int> vi;
typedef tuple<int, int, int> tiii;

multiset<tiii> build;
vector<vi> ans;

bool contains(tiii v) {
    return build.find(v) != build.end();
}

bool isGoodC(int x, int y) {
    return y == 0 || contains({x, y-1, 0}) 
            || contains({x, y, 1}) || contains({x-1, y, 1});
}

bool isGoodB(int x, int y) {
    if (contains({x, y-1, 0}))
        return true;
    if (contains({x+1, y-1, 0}))
        return true;
    return contains({x-1, y, 1}) && contains({x+1, y, 1});
}

bool isAlright() {
    for (const auto [x, y, a]: build) {
        if (a == 0) {
            if (!isGoodC(x, y))
                return false;
        }
        else {
            if (!isGoodB(x, y))
                return false;
        }
    }
    return true;
}

vector<vi> solution(int n, vector<vi> build_frame) {
    for (const vi& bf: build_frame) {
        int x = bf[0], y = bf[1], a = bf[2], b = bf[3];
        if (b == 1) {
            build.insert({x, y, a});
            if (!isAlright())
                build.erase(build.find({x, y, a}));
        }
        else {
            build.erase(build.find({x, y, a}));
            if (!isAlright())
                build.insert({x, y, a});
        }
    }
    
    for (const auto [x, y, a]: build)
        ans.push_back({x, y, a});
    
    return ans;
}