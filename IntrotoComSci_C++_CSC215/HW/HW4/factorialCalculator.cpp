/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 11/25/2017

 Course: CSC-215
 File:  factorialCalculator.cpp
 Rev #: 1.1
 Description: Repeatedly prompts the user for an integer input and
 and computes the factorial of that number. The program exits when
 the user enters a negative number.
 ============================================================*/

#include <iostream>
using namespace std;

int main(void)
{
int input = 1; //variable for user input
long factorial = 1; //variable to store each part of the factorial operation

	while(input >= 1) //while loop to exit the program
	{
	cout << "Enter a number: ";
	cin >> input; //prompt for user input

		for(int i = 1; i <= input; i++) //for loop for the factorial calculation
		{
			factorial = factorial * i;
		}

		cout << "The factorial of " << input << " is " << factorial << endl; //answer output
		factorial = 1; //resets factorial to 1, so that the factorial from the previous calculation is cleared
    }
    cout << "A negative number was entered, leading to an exit of the program." << endl; //output incase of a negative input

 return 0;
}
