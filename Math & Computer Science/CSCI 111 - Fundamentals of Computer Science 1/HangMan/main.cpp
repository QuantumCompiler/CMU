//
//  main.cpp
//  HangMan
//
//  Created by Taylor Larrechea on 11/27/17.
//  Copyright © 2017 Taylor Larrechea. All rights reserved.
//
#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <stdlib.h>
#include <time.h>
#include <ctime>
using namespace std;
// Keep track of, Incorrect guesses, Correct guesses, If someone repeats a guess, Max guesses
// Functions
// Display Function
string worddisplay(string word){
    string display = word;
    for (int i=0; i<display.length(); i++){
        if (word[i]==' '){
            display[i]=' ';
        }
        else
        display[i]= '-';
    }
    return display;
}
// Read Data
void readdata(string words[], int & totwords){
    ifstream fin;
    int i=0;
    fin.open("words.txt");
    if (!fin){
        cout << "File Not Found" << endl;
    }
    while (!fin.eof()){
        getline(fin,words[i]);
        i++;
    }
    cout << "Your puzzle is," << endl;
    totwords=i;
    fin.close();
}
// Random Word
int randword(int maxvalue) {
    srand(time(NULL));
    int ran = rand()%maxvalue;
//    cout<<ran<<endl;
    return ran;
}
// Guess Checker
bool guesscheck(string sectretword, string & playerword, char guess, string & guessedletters){
    bool found = false;
    for (int i=0; i < sectretword.length(); i++) {
        if (sectretword[i]==guess){
            playerword[i]=guess;
            found=true;
        }
    }
    if (!found) {
        guessedletters += guess;
    }
    return found;
}
// Check Win
bool checkwin(string secretword, string playerword){
    return secretword == playerword;
}
// Human vs. Human
void humanvhuman(string & secretword){
    string input;
    cin.ignore(100,'\n');
    cout << "Player 1 enter the puzzle for Hangman." << endl;
    cout << endl;
    getline(cin,input);
    secretword=input;
    cin.clear();
}
// Main
int main() {
    int option;
    string words[1000];
    string secretword;
    string playerword;
    string guessedletters="";
    char playguess;
    bool win=false;
    bool valid=false;
    cout << "Welcome to Hangman!" << endl;
    cout << "Would you like to play the computer or a person?" << endl;
    cout << "1 (Human vs. Human), 2 (Human vs. CPU)." << endl;
    cout << endl;
    while (!valid) {
    cin >> option;
    cout << endl;
    if (option == 2){
    int totwords;
    readdata(words,totwords);
    secretword = words[randword(totwords)];
    valid = true;
    }
    else if (option == 1){
        humanvhuman(secretword);
        valid = true;
    }
    }
    int maxguess=7;
    playerword = worddisplay(secretword);
    cout << playerword << endl;
    while (maxguess > 0 && !win) {
    cout << "Incorrect characters guessed are; " << guessedletters << endl;
    cout << "Player 2, enter your guess." << endl;
    cout << endl;
    cout << "Your puzzle is," << endl;
    cout << playerword << endl;
    cout << endl;
    cin >> playguess;
    cout << endl;
    if (guesscheck(secretword, playerword, playguess, guessedletters)){
        cout << "You guessed correctly!!" << endl;
    }
    else {
        cout << "You guessed incorrectly!!" << endl;
        maxguess --;
    }
    cout << "You have " << maxguess << " guesses remaining." << endl;
    cout << endl;
    win=checkwin(secretword, playerword);
    }
    
    if (win) {
        cout << "The puzzle was " << '"' << playerword << '"' << "." << endl;
        cout << endl;
        cout << "YOU HAVE WON!!" << endl;
    }
    else {
        cout << "The puzzle was " << '"' << secretword << '"' << "." << endl;
        cout << endl;
        cout << "GAME OVER!!" << endl;
    }
    return 0;
}
