//
//  main.cpp
//  ArrayOfGrades
//
//  Created by Taylor Larrechea on 10/25/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
#include <iostream>
#include <cmath>
#include <iomanip>
#include <fstream>
using namespace std;
// Maximum Students and Grades Allowed
const int MAXST=20;
const int MAXGD=10;
// Student Struct Type
struct student{
    string fname;
    string lname;
};
// Reads The Data For The Input
// Reads The Grade.In File For Program
void readdata(int & numstudents, int & numgrades, student students[], double grades[][MAXGD]){
    ifstream fin;
    fin.open("Grade.in");
    fin >> numstudents >> numgrades;
    for (int i=0; i < numstudents; i++){
        fin >> students[i].fname >> students[i].lname;
        for (int j=0; j < numgrades; j++){
            fin >> grades[i][j];
        }
    }
    fin.close();
}
// Convert to Letter Grade
char toletter(double avg){
    if (avg >= 90){
        return 'A';
    }
    else if(avg >=80 && avg < 90){
        return 'B';
    }
    else if(avg >= 70 && avg < 80){
        return 'C';
    }
    else if(avg >= 60 && avg < 70){
        return 'D';
    }
    else
        return 'F';
}
// Avgerage Calculator
double average(double grades[][MAXGD], int numgrades, int index){
    double sum=0;
    for (int i=0; i < numgrades; i++){
        sum += grades[index][i];
    }
    return sum/numgrades;
}
// Draw Line Function
void line(ofstream & fout, int length, char ch){
    for (int i=0; i < length; i++){
        fout << ch;
    }
    fout << endl;
}
// Write Data
// This Function Calculates Averages Amongst One Student As Well As All Students
void writedata(ofstream & fout, student students[], double grades[][MAXGD], int numstudents, int numgrades){
    double tempavg;
    double avgAvg=0;
    double gradeavg[MAXGD];
    for (int i=0; i < MAXGD; i++){
        gradeavg[i]=0;
    }
    fout << left << setw(20) << "First" << setw(20) << "Last";
    for (int i=0; i < numgrades; i++){
        fout << right << setw(7) << "Grade" << i+1;
    }
    fout << setw(8) << "Avg." << setw(3) << "G" << endl;
    line(fout, (51 + (8*numgrades)), '-');
    for (int i=0; i < numstudents; i++){
        fout << left << setw(20) << students[i].fname << setw(20) << students[i].lname;
        for (int j=0; j < numgrades; j++){
            fout << right << setw(8) << grades[i][j];
            gradeavg[j] += grades[i][j];
        }
        tempavg = average(grades, numgrades, i);
        avgAvg += tempavg;
        fout << setw(8) << setprecision(3) << tempavg << setw(3) << toletter(tempavg) << endl;
    }
    line(fout, (51 + (8*numgrades)), '-');
    fout << setw(40) << "Class Averages";
    for (int i=0; i < numgrades; i++){
        fout << setw(8) << setprecision(3) << gradeavg[i]/numstudents;
    }
    fout << setw(8) << avgAvg/numstudents << setw(3) << toletter(avgAvg/numstudents) << endl;
}
// Main Function
int main() {
    ofstream fout;
    student students[MAXST];
    double grades[MAXST][MAXGD];
    int numstudents;
    int numgrades;
    readdata(numstudents, numgrades, students, grades);
    fout.open("Grade.out");
    writedata(fout, students, grades, numstudents, numgrades);
    fout.close();
    return 0;
}
