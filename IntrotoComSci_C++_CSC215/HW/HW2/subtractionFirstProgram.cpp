/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date:        9/29/2016

 Course: CSC-215
 File:  subtractionFirstProgram.cpp
 Rev #: 1.0
 Description: This program computes the difference of two
              intergers and displays the result on screen
 ============================================================*/

#include <iostream>
using namespace std;

int main(void) {

    /* The following statement assigns a value of 35 to the integer variable number1 */
    int number1 = 35;
    /* The following statement assigns a value of 25 to the integer variable number2 */
    int number2 = 25;
    /* Creating a variable called result */
    int result = number1 - number2;

    cout << "The difference of "<< number1 << " and " << number2 << " is: " << result<< endl;

    return 0;
}
