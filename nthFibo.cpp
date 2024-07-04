#include <iostream>
using namespace std;

int fibonacci(int N){
    // 0 1 1 2 3 5 8
    int num=0,digit=0,digit2=1;
    for (int i = 1; i < N; i++)
    {
        num=digit+digit2;
        digit2=digit;
        digit=num;
    }
    return num;
}

int main(){
    int result = fibonacci(7);
    cout<<result;
    return 0;
}