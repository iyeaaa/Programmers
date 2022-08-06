#include <iostream>
#include <list>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    string strn; cin >> strn;
    list<char> editor(strn.begin(), strn.end());
    auto cursor = editor.end();
    int M; cin >> M;

    while(M--) {
        char cmd; cin >> cmd;
        switch (cmd) {
            case 'L':
                if(cursor != editor.begin())
                    cursor--;
                break;
            case 'D':
                if(cursor != editor.end())
                    cursor++;
                break;
            case 'B':
                if(cursor != editor.begin())
                    cursor = editor.erase(--cursor);
                break;
            case 'P':
                char x; cin >> x;
                editor.insert(cursor, x);
                break;
        }
    }

    for(auto it = editor.begin(); it != editor.end(); it++)
        cout << *it;

    return 0;
}


