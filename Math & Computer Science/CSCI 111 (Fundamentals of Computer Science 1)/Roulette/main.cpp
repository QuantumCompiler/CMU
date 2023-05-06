//
//  main.cpp
//  Roulette
//
//  Created by Taylor Larrechea on 9/20/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//

#include <iostream>
#include <iomanip>
#include <stdlib.h>
#include <time.h>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;

int main (){
    cout << "Hello, are you ready to play some Roulette?" << endl;
    cout << "First things first, you must only play until you have no money." << endl;
    cout << "You may start with a pot value and it can grow or decrease with how you play." << endl;
    cout << "You will be prompeted to ask for a size of the wheel for roulette that you'd like to play with." << endl;
    cout << "Once you lose all of your money, you can no longer play." << endl;
    cout << "So lets play!!" << endl;
    cout << endl;
    cout << "Please enter and integer pot value you'd wish to play with." << endl;
    cout << "i.e the minimum starting pot value must be equal to or greater than 1." << endl;
    cout << endl;
    // sum is pot value
    int sum=0;
    cin >> sum;
    cout << endl;
    cout << "Please select a wheel size from 1 to infinity." << endl;
    cout << endl;
    // d is wheel size
    int d=0;
    cin >> d;
    if (d<=0){
        cout << endl;
        cout << "Invalid wheel size chosen." << endl;
        cout << "Please input a valid size. i.e (1 to 36)" << endl;
        cout << endl;
        cin >> d;
    }
    // b is bet
    int b=0;
    cout << endl;
    cout << "Please place your bet, you can not bet more than your total pot value." << endl;
    cout << endl;
    cin >> b;
    if (b>sum){
        cout << endl;
        cout << "Invalid bet has been placed." << endl;
        cout << "Please input a valid bet." << endl;
        cout << endl;
        cin >> b;
    }
    cout << endl;
    // c is guess for game
    int c=0;
    cout << "Current balance " << sum << endl;
    cout << "Please guess an integer from 1 to the number you picked." << endl;
    cout << endl;
    cin >> c;
    // i is random number
    int i=0;
    srand(time_t(0));
        while (sum>0){
        i = rand()%d +1;
        if (c==i){
            cout << endl;
            cout << "You have won!!" << endl;
            cout << "The correct number was " << c << "." << endl;
            cout << endl;
            sum +=b;
            cout << "Current balance " << sum << "." << endl;
            cout << "Please place another bet!" << endl;
            cout << endl;
            cin >> b;
            if (b>sum){
                cout << endl;
                cout << "Invalid bet has been placed." << endl;
                cout << "Please input a valid bet." << endl;
                cout << endl;
                cin >> b;
            }            cout << endl;
            cout << "Please guess another integer." << endl;
            cout << endl;
            cin >> c;
            }
        else if (c!=i && sum>0){
            cout << endl;
            cout << "The number was " << i << "." << endl;
            cout << "You guessed the number " << c << "." << endl;
            cout << endl;
            sum-=b;
            cout << endl;
            if(sum >0){
            cout << "Current balance " << sum << "." << endl;
            cout << "Please place another bet." << endl;
            cout << endl;
            cin >> b;
            if (b>sum){
                cout << endl;
                cout << "Invalid bet has been placed." << endl;
                cout << "Please input a valid bet." << endl;
                cout << endl;
                cin >> b;
                }
            cout << endl;
            cout << "Please guess another integer." << endl;
            cout << endl;
            cin >> c;
            }
        }
            
        }
    cout << endl;
    cout << "Game over." << endl;
    cout << "Your pot value has diminished to zero." << endl;
    cout << "You can no longer play." << endl;
    cout << endl;
    return 0;
}
