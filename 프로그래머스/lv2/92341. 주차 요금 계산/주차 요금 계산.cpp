#include <string>
#include <vector>
#include <map>
using namespace std;

int base_time;
int base_fee;
int unit_time;
int unit_fee;

map<string, int> parking;
map<string, int> time_sum;
vector<int> result;

int price(int time) {
    if (time <= base_time)
        return base_fee;
    return base_fee + (time-base_time+unit_time-1)/unit_time * unit_fee;
}

vector<int> solution(vector<int> fees, vector<string> records) {
    base_time = fees[0];
    base_fee = fees[1];
    unit_time = fees[2];
    unit_fee = fees[3];
    
    for (string& s: records) {
        string id = s.substr(6, 4);
        int time = stoi(s.substr(0,2))*60 + stoi(s.substr(3,2));
        if (s.substr(11) == "IN") {
            parking[id] = time;
        } else {
            time_sum[id] += time - parking[id];
            parking.erase(id);
        }
    }
    
    for (auto [id, time]: parking)
        time_sum[id] += (23*60+59 - time);
    
    for (auto [id, time]: time_sum)
        result.push_back(price(time));
    
    return result;
}