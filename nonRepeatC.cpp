#include <iostream>
#include <unordered_map>
using namespace std;

int countNonRepeatedDigits(int number) {
    unordered_map<int, int> digitCount;
    int originalNumber = number;

    // Count the frequency of each digit
    while (number > 0) {
        int digit = number % 10;
        digitCount[digit]++;
        number /= 10;
    }

    // Count the number of digits that appear exactly once
    int nonRepeatedCount = 0;
    for (const auto& entry : digitCount) {
        if (entry.second == 1) {
            nonRepeatedCount++;
        }
    }

    return nonRepeatedCount;
}

int main(){
    int N = 1015;
    int result=countNonRepeatedDigits(N);
    cout<<result;
    return 0;
}