#include <functional>
#include <iostream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int steps(vector <int> offsets, function <int(int)> mut) {
    auto retval = 0, inc = 0;
    for (auto cur = offsets.begin(); cur < offsets.end() && cur >= offsets.begin(); cur += inc ) {
        retval++;
        inc = *cur;
        *cur = mut(*cur);
    }
    return retval;
}

int main() {
    vector<int> offsets {istream_iterator<int> {cin}, {}};

    // Part 1
    cout << steps(offsets, [](int x){ return x + 1; }) << endl;

    // Part 2
    cout << steps(offsets, [](int x){ return x >= 3 ? x - 1 : x + 1; }) << endl;
}