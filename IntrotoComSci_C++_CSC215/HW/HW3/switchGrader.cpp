/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 11/10/2017

 Course: CSC-215
 File:  switchGrader.cpp
 Rev #: 1.1
 Description: This program takes a user inputted grade (0-100), and
 determines which letter grade the number corresponds to. Uses switch construct
 ============================================================*/

 #include <iostream>
 using namespace std;

int main(void)
{
string checker = "yes"; //needed for while loop check
int numGrade = 0;

while(checker == "yes") /*while loop that allows for the user to calculate
						multiple grades in one run of the program*/
{
cout << "Enter the number of points scored:"<< endl;
cin >> numGrade; //input of numGrade

	switch(numGrade)         //switch construct to determine letter grade (checks each number range)
	{

case 93 ... 100:
{
	cout << "The letter grade for " << numGrade << " is: A" << endl;
	break;
}
case 90 ... 92:
{
	cout << "The letter grade for " << numGrade << " is: A-" << endl;
	break;
}
case 88 ... 89:
{
	cout << "The letter grade for " << numGrade << " is: B+" << endl;
	break;
}
case 83 ... 87:
{
	cout << "The letter grade for " << numGrade << " is: B" << endl;
	break;
}
case 80 ... 82:
{
	cout << "The letter grade for " << numGrade << " is: B-" << endl;
	break;
}
case 78 ... 79:
{
	cout << "The letter grade for " << numGrade << " is: C+" << endl;
	break;
}
case 73 ... 77:
{
	cout << "The letter grade for " << numGrade << " is: C" << endl;
	break;
}
case 70 ... 72:
{
	cout << "The letter grade for " << numGrade << " is: C-" << endl;
	break;
}
case 68 ... 69:
{
	cout << "The letter grade for " << numGrade << " is: D+" << endl;
	break;
}
case 63 ... 67:
{
	cout << "The letter grade for " << numGrade << " is: D" << endl;
	break;
}
case 60 ... 62:
{
	cout << "The letter grade for " << numGrade << " is: D-" << endl;
	break;
}
case 0 ... 59:
{
	cout << "The letter grade for " << numGrade << " is: F" << endl;
	break;
}
default :
{
	cout << "Enter a correct number." << endl; //in case a non-valid number is entered
	break;
}

	}

cout << "Would you like to perform another calculation? Enter yes or no." << endl; //Checks if the user wants to calculate another grade
cin >> checker; //if yes, runs another loop of the program, if no it exits to the return 0

}
 return 0;
}
