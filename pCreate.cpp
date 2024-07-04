#include <iostream>
#include <algorithm>

using namespace std;

int getOneDigit(int N){
    return N%10;
}
int getTenDigit(int N){
    return (N/10)%10;
}
int getHunDigit(int N){
    return N/100;
}

int getMaxDigit(int num){
    int maxDigit=0;
    while (num>0)
    {
        maxDigit=max(maxDigit,num%10);
        num/=10;
    }
    return maxDigit;    
}

int genPin(int input1,int input2,int input3){
    int unit1=getOneDigit(input1);
    int unit2=getOneDigit(input2);
    int unit3=getOneDigit(input3);

    int tens1=getTenDigit(input1);
    int tens2=getTenDigit(input2);
    int tens3=getTenDigit(input3);

    int hundred1=getHunDigit(input1);
    int hundred2=getHunDigit(input3);
    int hundred3=getHunDigit(input3);

    int minUnit=min({unit1,unit2,unit3});
    int minTens=min({tens1,tens2,tens3});
    int minHun=min({hundred1,hundred2,hundred3});

    int maxNum=max({getMaxDigit(input1),getMaxDigit(input2),getMaxDigit(input3)});

    return minUnit+(minTens*10)+(minHun*100)+(maxNum*1000);
}

int main(){
    int N1=123;
    int N2=582;
    int N3=175;
    cout<<genPin(N1,N2,N3);
    return 0;
}