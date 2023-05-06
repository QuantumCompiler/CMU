//
//  main.cpp
//  RNA Secondary Sequence
//
//  Created by Taylor Larrechea on 12/6/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//

#include <iostream>
#include <string>
#include <fstream>
using namespace std;

struct section {
    char let;
    int count;
};
// Break Up Raw String Into Array of Sections
void breakup(section sequence[], string raw, int & size){
    size=0;
    int pos=1;
    string count= "";
    while(pos < raw.length()) {
        sequence[size].let=raw[pos-1];
        while ((int)raw[pos]>=48 && (int)raw[pos]<=57 && pos<raw.length()){
            count += raw[pos];
            pos ++;
        }
        sequence[size].count = stoi(count);
        count = "";
        size ++;
    }
}
int main() {
    string raw;
    int size;
    section sequence[20];
        cin >> raw;
        breakup(sequence,raw,size);
        for (int i=0; i<size; i++){
            for (int j=0; j<sequence[i].count; j++){
                cout << sequence[i].let;
            }
        }
    return 0;
}
