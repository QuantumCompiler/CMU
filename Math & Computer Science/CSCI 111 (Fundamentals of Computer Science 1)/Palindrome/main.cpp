//
//  main.cpp
//  Palindrome
//
//  Created by Taylor Larrechea on 11/15/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//

#include <iostream>
using namespace std;

int main() {
    int n;
    int value;
    int reversedNumber=0;
    int remainder;
    cout << "Enter a number between 10 & 100." << endl;
    cin >> n;
    value=n;
    if (n>=10 && n<=100){
        while (n!=0){
        remainder = n%10;
        reversedNumber = reversedNumber*10 + remainder;
        n /= 10;
        }
    cout << "Your palindrome addition is " << reversedNumber + value << "." << endl;
    }
    else {
        cout << "The number you entered is out of bounds." << endl;
    }
    return 0;
}
