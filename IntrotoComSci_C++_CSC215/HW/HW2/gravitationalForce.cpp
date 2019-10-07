/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date:        10/5/2017

 Course: CSC-215
 File:  gravitationalForce.cpp
 Rev #: 1.1
 Description: This program calculates the gravitational force at
 a distance provided by the user and displays the results.
 ============================================================*/

#include <iostream>
using namespace std;

int main(void) {
double g1 = 9.8;
double g2 = 0.0;
double d1 = 6400;
double d2 = 0;

cout << "Enter distance from center of the earth (in kilometers) for gravitational force calculation:" << endl;
cin >> d2;
g2 = ((d2/d1)*(d2/d1))/g1; //could have used cmath, but this was easier
g2 = 1/g2;
cout << "The gravitational force at " << d2 << " is " << g2 << " m/s^2" << endl;


    return 0;
}
