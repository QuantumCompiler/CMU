//
//  main.cpp
//  MultiplicationTable
//
//  Created by Taylor Larrechea on 9/10/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//


#include <iostream>
using namespace std;

int main()
{
    cout << "Your 12x12 Multiplication Table" << endl;
    cout << "1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t11\t12" << endl;
    for (int i = 1; i < 13; i++)
    {
        cout << " " << endl;
        for (int c = 1; c < 13; c++)
        {
            cout << i*c << '\t';
        }
        cout << endl;
    }
    return 0;
}
