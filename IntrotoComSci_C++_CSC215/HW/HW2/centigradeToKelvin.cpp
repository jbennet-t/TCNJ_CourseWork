/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date:        10/9/2017

 Course: CSC-215
 File:  centigradeToKelvin.cpp
 Rev #: 1.1
 Description: This program converts the temperature in centigrade (provided by the user
 to Kelvin using the formula K = 273 + C.
 ============================================================*/

#include <iostream>
using namespace std;

int main(void) {
double K = 0.0;
double C = 0.0;

cout << "Enter temperature in Centigrade for conversion to Kelvin:" << endl;
cin >> C;
K = 273 + C;
cout << C << " degrees Centigrade is " << K << " degrees Kelvin" << endl;


    return 0;
}
