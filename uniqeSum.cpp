#include <iostream>
#include <unordered_map>
using namespace std;

int coutUnique(int N)
{
    unordered_map<int, int> digitC;
    int sum = 0;
    while (N > 0)
    {
        int digit = N % 10;
        digitC[digit]=digit;
        N /= 10;
    }

    for (const auto &entry : digitC)
    {
        sum += entry.second;
    }

    return sum;
}

int main()
{
    int N = 255334;
    int result=coutUnique(N);
    cout<<result;
    return 0;
}