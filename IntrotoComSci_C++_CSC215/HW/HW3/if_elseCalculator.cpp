/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 11/10/2017

 Course: CSC-215
 File:  if_elseCalculator.cpp
 Rev #: 1.1
 Description: This program performs simple calculations by prompting
 the user for 2 numbers and an operator, and then uses these values
 to calculate the result. Uses if-else statements to solve the problem.
 A while loop was included to perform multiple calculations in one run of
 the program.
 ============================================================*/

 #include <iostream>
 #include <math.h> //needed for modulo option
 using namespace std;

int main(void)
{
string checker = "yes"; //needed for while loop check
double num1 = 0.0;
double num2 = 0.0;
string arthOp = "a"; //operator
double result = 0.0;

while(checker == "yes") /*while loop that allows for the user to do multiple
						calculations in one run of the program*/
{
cout << "Enter the first number in the operation:" << endl;
cin >> num1; //input of first num
cout << "Enter the second number in the operation:" << endl;
cin >> num2; //input of second num
cout << "Enter the operator in the operation: (Ex. +, -, *, /, or %)" << endl;
cin >> arthOp; //input of operator

	if(arthOp == "+")
	{
	 result = (num1+num2);
	 cout << "The answer is: " << result << endl;  //calculation for addition
 	}
 	else if(arthOp == "-")
	{
	 result = (num1-num2);
	 cout << "The answer is: " << result << endl;  //calculation for subtraction
 	}
	else if(arthOp == "*")
	{
	 result = (num1*num2);
	 cout << "The answer is: " << result << endl;  //calculation for multiplication
 	}
	else if(arthOp == "/")
	{
	 result = (num1/num2);
	 cout << "The answer is: " << result << endl;  //calculation for division
 	}
	else if(arthOp == "%")
	{
	 result = fmod(num1,num2);
	 cout << "The answer is: " << result << endl;  //calculation for remainder
 	}
	else
	{
	cout << "Enter a correct operator and try again." << endl; //in case a symbol that is not an operator is entered
	}

cout << "Would you like to perform another calculation? Enter yes or no." << endl; //Checks if the user wants to perform another calculation
cin >> checker; //if yes, runs another loop of the program, if no it exits to the return 0

}
 return 0;
}
