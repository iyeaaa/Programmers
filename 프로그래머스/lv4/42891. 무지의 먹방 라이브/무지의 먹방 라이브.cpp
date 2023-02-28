#include <string>
#include <vector>
#include <algorithm>
#include <iostream>
#include <queue>
#define all(x) (x).begin(), (x).end()
using namespace std;
typedef long long ll;

vector<int> food;
ll pass;

int solution(vector<int> food_times, ll k) {
    for (int v: food_times)
        food.push_back(v);
    
    sort(all(food), greater<int>());
    
    while (!food.empty()) {
        ll cc = (food.back() - pass) * food.size();
        
        // 한 순회과정 중 장애 과정이 생기는 경우
        if (k - cc < 0)
            break;
        
        k -= cc;
        pass += food.back() - pass;
        food.pop_back();
        
        while (!food.empty() && food.back() <= pass)
            food.pop_back();
    }
    
    if (food.empty())
        return -1;
    
    int idx = k % food.size() + 1;
    
    for (int i=0; i<food_times.size(); i++)
        if (pass < food_times[i] && --idx == 0)
            return i+1;
}