/*==========================================================
 Author: Jahangir Nakra
 Modified By: -
 Date:        9/9/2016

 Course: CSC-215
 File:  firstProgram.cpp
 Rev #: 1.0
 Description: This program demonstrates the assignment of values
              to multiple integers, computing the sum of the
              intergers and displaying the values on screen
 ============================================================*/

#include <iostream>
using namespace std;

int main(void) {

    /* The following statement assigns a value of 20 to the integer variable number1 */
    int number1 = 20;
    /* The following statement assigns a value of 20 to the integer variable number2 */
    int number2 = 19;
    /* Creating a variable called result */
    int result = number1 + number2;

    cout << "The sum of "<< number1 << " and " << number2 << " is: " << result<< endl;

    return 0;
}
