/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 11/25/2017

 Course: CSC-215
 File:  trianglePrinter.cpp
 Rev #: 1.1
 Description: This program prompts the user for an integer input, and then
 displays a right triangle with a base and length of that integer.
 ============================================================*/

#include <iostream>
using namespace std;

int userInput = 0;
int main(void)
{
//variable for user input

cout << "Enter an integer for the base and height of a right triangle to be printed:" << endl;
cin >> userInput; //prompt for user input

	for(int i = 1; i <= userInput; i++)//nested for loop that prints out the triangle
	{
		for(int j = 1; j<=i; j++)
		{
			cout << "*" ;
		}
		cout << endl;
	}
 return 0;
}
