//
//  main.cpp
//  MathEquations
//
//  Created by Taylor Larrechea on 10/11/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//

#include <iostream>
#include <cmath>
#include <sstream>
#include <iomanip>
using namespace std;

// Functions
// Square Root Funtion
float mysqrt(float num){
    double x1=num/2;
    while (abs(x1*x1 - num) > 0.00001)
    if (x1*x1 - num > 0.00001){
        x1=x1-x1/2;
    }
    else if(x1*x1 - num < -0.00001){
        x1=x1+x1/2;
    }
    return x1;
}
// Factorial Function
long myfact(int x){
        long ans=1;
        for (int i=x; i>=1; i--){
            ans *=i;
        }
        return ans;
}
// Sine Funtion
float sine(float x){
    float ans=0;
    for (int k=0; k<=10; k++){
        ans +=(pow(-1,k)*pow(x,2*k+1))/myfact(2*k+1);
    }
    return ans;
}
// Cosine Funtion
float cosine(float x){
    float ans=0;
    for (int k=0; k<=10; k++){
        ans +=(pow(-1.0,k)*pow(x,2.0*k))/(myfact(2*k));
    }
    return ans;
}
// Tangent Function
float tangent(float x){
    float ans;
    ans=sine(x)/cosine(x);
    
    return ans;
     }
// Main Function
int main() {
    string undef;
    float radian=(3.14159/180);
    float sineinput;
    float sineoutput;
    float cosineinput;
    float cosineoutput;
    float tangentinput;
    float tangentoutput;
    float mysqrtinput;
    float mysqrtoutput;
    cout << "Welcome to your math funcitons!" << endl;
    cout << "Your entries for your trigonometric caculations must be in degrees" << endl;
    cout << "To convert from radians, multiply by (180/pi) where pi=3.14159" << endl;
    cout << endl;
    // Sine Input
    cout << "Please enter a value for your sine calculation" << endl;
    cin >> sineinput;
    sineinput *= radian;
    sineoutput = sine(sineinput);
    cout << fixed;
    cout << "Your sine calculation is " << setprecision(1) << sineoutput << endl;
    cout << endl;
    // Cosine Input
    cout << "Please enter a value for your cosine calculation" << endl;
    cin >> cosineinput;
    cosineinput *= radian;
    cosineoutput = cosine(cosineinput);
    cout << fixed;
    cout << "Your cosine calculation is " << setprecision(1) << cosineoutput << endl;
    cout << endl;
    // Tangent Input
    cout << "Please enter a value for your tangent calculation" << endl;
    cin >> tangentinput;
    // Testing for undefined tangent input i.e any multiple of 180 added on to 90,270,,, etc.
    if (tangentinput==-90 || tangentinput==90 || tangentinput==-270 || tangentinput==270
        || tangentinput== -450 || tangentinput== 450 || tangentinput== -630 || tangentinput== 630) {
    cout << "Undefined output" << endl;
    }
    else  {
    tangentinput *= radian;
    tangentoutput = tangent(tangentinput);
    cout << fixed;
    cout << "Your tangent calculation is " << setprecision(1) << tangentoutput << endl;
    }
    cout << endl;
    // Square Root Input
    cout << "Please enter a value for your square root calculation" << endl;
    cin >> mysqrtinput;
    mysqrtoutput = mysqrt(mysqrtinput);
    cout << fixed;
    cout << "Your square root is " << setprecision(2) << mysqrtoutput << endl;
    return 0;
}
