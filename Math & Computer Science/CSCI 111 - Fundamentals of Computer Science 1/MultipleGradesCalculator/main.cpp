//  main.cpp
//  Server
//  Multiple Grades Calculator
//  Created by Taylor Larrechea on 10/9/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//
//

#include <iostream>
#include <string>

using namespace std;


int main(){
    string Name;
    int min = 1000;
    int max = 0;
    float average;
    int newgrade;
    int input;
    float sum = 0;
    int i;
    cout << "What is your name?" << endl;
    cin >> Name;
    cout << "How many grades do you wish to calculate?" << endl;
    cin >> input;
    cout << "Enter grade values now." << endl;
    for (i = 0; i < input; i++)
    {
        cin >> newgrade;
        sum = newgrade + sum;
        if (newgrade < min) min = newgrade;
        if (newgrade > max) max = newgrade;
    }
    average = sum / input;
    cout << "Hey," << Name << " Your max and min grades are..." << endl;
    cout << "Max:" << max << endl;
    cout << "Min:" << min << endl;
    cout << "Your average grade is:" << average << endl;
    if (average >= 90) cout << "Your grade is an A, you are Superb!!" << endl;
    else if (average >= 80) cout << "Your grade is a B, you are a fantastic student!!" << endl;
    else if (average >= 70) cout << "Your grade is a C, you are an average student" << endl;
    else if (average >= 60) cout << "Your grade is a D, you need to study more!" << endl;
    else  cout << "Your grade is an F, please send help!" << endl;
    return 0;
}
