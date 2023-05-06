//
//  main.cpp
//  Ammortization
//
//  Created by Taylor Larrechea on 9/26/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//

#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;
using std::setw;

int main () {
    cout << " " << setw(50) << "Amortization Table" << endl;
    cout << " " << setw(68) << "We will first have to ask you for some information." << endl;
    cout << endl;
    cout << " " << setw(53) << "Please enter loan amount." << endl;
    // amount is the loan amount.
    double amount=0;
    // input loan amount.
    cin  >> amount;
    cout << " " << setw(63) << "Please enter an interest rate for your loan." << endl;
    // intr is interest rate.
    double intr=0;
    // input interest rate.
    cin >> intr;
    intr=intr/100;
    cout << " " << setw(64) << "Please enter your remaing payments in months." << endl;
    // months is payments remaining;
    double months=0;
    // input payments remaining.
    cin >> months;
    cout << endl;
    // monthrate is monthly interest rate.
    double monthrate=0;
    monthrate=pow(1+intr,1.0/12.0)-1.0;
    // monthpay is monthly payment.
    double monthpay= amount*monthrate/(1.0-pow(1.0+monthrate,-months));
    double interest=0;
    double princ=0;
    double remaining=amount;
    cout << setw(10) << "Months" << setw(20) << "Monthly Payment"
    << setw(20) << "Principal Paid" << setw(20) << "Interest Paid"
    << setw(20) << "Remaining Balance" << endl;
    cout << setw(10) << "0" << setw(20) << "-"
    << setw(20) << "-" << setw(20) << "-"
    << setw(20) << remaining << endl;
    cout.precision(2);
    for (int i=1; i <= months; i++ ){
    // interest is interest paid.
        interest=remaining*monthrate;
    // principle paid is princ.
        princ=monthpay-interest;
    // remaining is remaining balance.
        remaining=remaining-princ;
        cout << fixed << setw(10) << i << setw(20) << monthpay
             << setw(20) << princ << setw(20) << interest
             << setw(20) << remaining << endl;
    }

    return 0;

}
