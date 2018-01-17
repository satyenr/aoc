#include <functional>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int steps(vector <int> offsets, function <int(int)> mut) {
    auto steps = 0, inc = 0;
    for (auto cur = offsets.begin(); cur < offsets.end() && cur >= offsets.begin(); cur += inc ) {
        steps++;
        inc = *cur;
        *cur = mut(*cur);
    }
    return steps;
}

int main() {
    vector <int> offsets;
    string line;
    while (getline(cin, line)) {
        stringstream val(line);
        int x = 0;
        val >> x;
        offsets.push_back(x);
    }

    // Part 1
    cout << steps(offsets, [](int x){ return x + 1; }) << endl;

    // Part 2
    cout << steps(offsets, [](int x){ return x >= 3 ? x - 1 : x + 1; }) << endl;
}