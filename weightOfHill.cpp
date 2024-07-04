#include <iostream>
using namespace std;

void StarPat(int level,int head,int weight){
    int increment=2,increasedH=head;
    for (int i = 0; i < level; i++)
    {
        cout<<increasedH<<endl;
        for (int j = 0; j < increasedH; j++)
        {
            cout<<"*";
        }
        cout<<'\n';
        head=(head+weight);
        increasedH=head*increment;
        increment++;
    }
}

int main(){
    int level=5,head=10,weight=2;
    StarPat(level,head,weight);
    return 0;
}