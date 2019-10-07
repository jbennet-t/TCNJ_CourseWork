/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 11/10/2017

 Course: CSC-215
 File:  if_elseGrader.cpp
 Rev #: 1.1
 Description: This program takes a user inputted grade (0-100), and
 determines which letter grade the number corresponds to. Uses if-else
 ============================================================*/

 #include <iostream>
 using namespace std;

int main(void)
{
string checker = "yes"; //needed for while loop check
double numGrade = 0.0;

while(checker == "yes") /*while loop that allows for the user to calculate
						multiple grades in one run of the program*/
{
cout << "Enter the number of points scored:"<< endl;
cin >> numGrade; //input of numGrade

if(numGrade <= 100 && numGrade >= 93)                                //if-else loop to determine letter grade (checks each number range)
{
	cout << "The letter grade for " << numGrade << " is: A" << endl;
}
else if(numGrade <= 92 && numGrade >= 90)
{
	cout << "The letter grade for " << numGrade << " is: A-" << endl;
}
else if(numGrade <= 89 && numGrade >= 88)
{
	cout << "The letter grade for " << numGrade << " is: B+" << endl;
}
else if(numGrade <= 87 && numGrade >= 83)
{
	cout << "The letter grade for " << numGrade << " is: B" << endl;
}
else if(numGrade <= 82 && numGrade >= 80)
{
	cout << "The letter grade for " << numGrade << " is: B-" << endl;
}
else if(numGrade <= 79 && numGrade >= 78)
{
	cout << "The letter grade for " << numGrade << " is: C+" << endl;
}
else if(numGrade <= 77 && numGrade >= 73)
{
	cout << "The letter grade for " << numGrade << " is: C" << endl;
}
else if(numGrade <= 72 && numGrade >= 70)
{
	cout << "The letter grade for " << numGrade << " is: C-" << endl;
}
else if(numGrade <= 69 && numGrade >= 68)
{
	cout << "The letter grade for " << numGrade << " is: D+" << endl;
}
else if(numGrade <= 67 && numGrade >= 63)
{
	cout << "The letter grade for " << numGrade << " is: D" << endl;
}
else if(numGrade <= 62 && numGrade >= 60)
{
	cout << "The letter grade for " << numGrade << " is: D-" << endl;
}
else if(numGrade <= 59)
{
	cout << "The letter grade for " << numGrade << " is: F" << endl;
}
else
{
	cout << "Enter a correct number." << endl; //in case a non-valid number is entered
}

cout << "Would you like to perform another calculation? Enter yes or no." << endl; //Checks if the user wants to perform another calculation
cin >> checker; //if yes, runs another loop of the program, if no it exits to the return 0

}
 return 0;
}
