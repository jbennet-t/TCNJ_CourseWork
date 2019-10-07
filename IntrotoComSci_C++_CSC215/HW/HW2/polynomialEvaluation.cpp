/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date:        10/9/2017

 Course: CSC-215
 File:  polynomialEvaluation.cpp
 Rev #: 1.1
 Description: This program evalulates a polynomial for a value that
 the user inputs for x and returns the solution.
 ============================================================*/

#include <iostream>
#include <cmath> //included for exponents needed in polynomial
using namespace std;

int main(void) {
double x = 0.0;
double a = 0.0;
double b = 0.0;
double solution = 0.0;

cout << "Enter a value of x for input into the polynomial 3x^5 - 13x^2 - 3x + 21:" << endl;
cin >> x;
a = pow(x,5);
b = pow(x,2);
solution = ((3*a)-(13*b)-(3*x)+21); //final polynomial equation

cout << "The solution for x = " << x << " is " << solution << endl;


    return 0;
}
