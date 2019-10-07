/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 12/19/2017

 Course: CSC-215
 File:  final.cpp
 Rev #: 1.1
 Description: A program that implements a phone book. The program contains
 entries in the format of: First Name, Last Name, and a 10 digit phone number.
 The entries are all contained in vectors. The program has the ability to add,
 delete, display, and search for entries. A menu is presented to the user,
 allowing them to choose an action.
 ============================================================*/

#include <iostream>
#include <string>
#include <vector>


using namespace std;

int userDefLength = 500; //user defined length of phonebook (applies to all 3 vectors)
int increment = -1; //count for adding people to phone book
string userAction = ""; //int for user action
string firstN = ""; //string for first name
string lastN = ""; //string for last name
string phoneNum = ""; //string for phonenumber
string infoOutput = ""; //string for the return of each function
string infoEdit = ""; //string for editing a person's information
string newNum = ""; //string for editing a person's number
string newFirst = ""; //string for editing a person's first name
string newLast = ""; //string for editing a person's last name
string actionReturn = ""; //string to return the output of an action

vector <string> firstName(userDefLength); //vector containing all first names
vector <string> lastName(userDefLength); //vector containing all last names
vector <string> phoneNumber(userDefLength); //vector containing all phone numbers

//1
string addName(string firstN, string lastN, string phoneNum) //function that adds a first name, last name, and phone number to the vectors
{
	increment += 1;
	if(increment <= userDefLength)//checks to see if the maximum number of people is reached
	{
		firstName.at(increment) = firstN;
		lastName.at(increment) = lastN;
		phoneNumber.at(increment) = phoneNum;
		infoOutput = "This person's information has been added as: " + lastN + "," + firstN + " Number: " + phoneNum; //formats output
	}
	else
	{
		infoOutput = "Your phonebook is full. Sorry!"; //in case the maximum number of people is reached
	}

return infoOutput; //returns formated information
}

//2
string findName(string lastN, string firstN) //finds person based on first and last name
{
	for(int i = 0; i <= increment; i++)
	{
		if(lastName.at(i) == lastN && firstName.at(i) == firstN)
		{
			infoOutput = "This person's information is: " + lastN + "," + firstN + " Number: " + phoneNumber.at(i); //formats output
			break;
		}
		else
		{
			infoOutput = "This person is not in your phonebook, or you have entered their name incorrectly. Please try again."; //in case an incorrect name is entered
		}
	}

	return infoOutput;
}

//3
string findNumber(string phoneNum)//finds person based on phone number
{
	for(int i = 0; i <= increment; i++)
	{
		if(phoneNumber.at(i) == phoneNum)
		{
			infoOutput = "This person's information is: " + lastName.at(i) + "," + firstName.at(i) + " Number: " + phoneNum;
			break;
		}
		else
		{
			infoOutput = "This person is not in your phonebook, or you have entered their number incorrectly. Please try again.";
		}
	}

	return infoOutput;
}

//4
string removeName(string lastN, string firstN) //removes person from phonebook
{
	for(int i = 0; i <= increment; i++)
	{
		if(lastName.at(i) == lastN && firstName.at(i) == firstN)
		{
			lastName.erase(lastName.begin() + i);
			firstName.erase(firstName.begin() + i);
			phoneNumber.erase(phoneNumber.begin() + i);
			infoOutput = "Person Removed";
			break;
		}
		else
		{
			infoOutput = "This person is not in your phonebook, or you have entered their name incorrectly. Please try again.";
		}
	}

	return infoOutput;
}

//5
string editPerson(string firstN, string lastN, string phoneNum) //edits the information of a person
{
	for(int i = 0; i <= increment; i++)
	{
		if(lastName.at(i) == lastN && firstName.at(i) == firstN && phoneNumber.at(i) == phoneNum)
		{
			lastName.at(i) = newFirst;
			firstName.at(i) = newLast;
			phoneNumber.at(i) = newNum;
			infoOutput = "This person's information is now: " + lastName.at(i) + "," + firstName.at(i) + " Number: " + phoneNumber.at(i);
			break;
		}
		else
		{
			infoOutput = "This person is not in your phonebook, or you have entered their name incorrectly. Please try again.";
		}
	}

	return infoOutput;
}


int main() //main method
{
//cout << "How many people would you like in your phone book? (Enter an integer):  "; //prompts user for the size of the phonebook (= size of the vectors)
//cin >> userDefLength;

while(userAction != "7") //while loop, if userAction == 7, it exits the program
{

cout << "<--- Personal Phone Book --->" << endl;
cout << "    (1) Add New Person" <<endl;
cout << "    (2) Search by Person" <<endl;
cout << "    (3) Search by Number" <<endl;
cout << "    (4) Remove Person" <<endl;             //menu output
cout << "    (5) Edit Person's Info" <<endl;
cout << "    (6) Display All People" <<endl;
cout << "    (7) Exit Phone Book" <<endl;
cout << " " << endl;

cout << "Choose a number 1-7 for an action:  "; //prompts user for a command
cin >> userAction;

	if(userAction == "1") //Add new person
	{
		cout << endl << "Enter a first name:";
		cin >> firstN;
		cout << endl <<  "Enter a last name:";
		cin >> lastN;
		cout << endl << "Enter a phone number (without spaces or dashes):";
		cin >> phoneNum;
		cout << endl;
		actionReturn = addName(firstN, lastN, phoneNum);
		cout << actionReturn << endl;
	}

	else if(userAction == "2") //Search by person
		{
			cout << endl << "Enter a last name:";
			cin >> firstN;
			cout << endl <<  "Enter a first name:";
			cin >> lastN;
			cout << endl;
			actionReturn = findName(firstN, lastN);
			cout << actionReturn << endl;
		}

	else if(userAction == "3") //Search by number
		{
			cout << endl << "Enter a number:";
			cin >> phoneNum;
			cout << endl;
			actionReturn = findNumber(phoneNum);
			cout << actionReturn << endl;
		}

	else if(userAction == "4") //Delete a person
		{
			cout << endl << "Enter a last name:";
			cin >> firstN;
			cout << endl <<  "Enter a first name:";
			cin >> lastN;
			cout << endl;
			actionReturn = removeName(firstN, lastN);
			increment--;
			cout << actionReturn << endl;
		}

	else if(userAction == "5") //Edit a person's info
		{
			cout << endl << "Enter a last name:";
			cin >> firstN;
			cout << endl <<  "Enter a first name:";
			cin >> lastN;
			cout << endl << "Enter a number:";
			cin >> phoneNum;
			cout << endl;
			cout << "Enter \"num\" to change number, \"first\" to change first name, or \"last\" to change last name" << endl;
			cin >> infoEdit;

				if(infoEdit == "num") //if loop to edit someones information, edits one string at a time
				{
					cout << "Enter new number: ";
					cin >> newNum;
					cout << endl;
					newFirst = firstN;
					newLast = lastN;
					actionReturn = editPerson(lastN, firstN, phoneNum);
					cout << actionReturn << endl;
				}

				else if(infoEdit == "first")
				{
					cout << "Enter new first name: ";
					cin >> newFirst;
					cout << endl;
					newNum = phoneNum;
					newLast = lastN;
					actionReturn = editPerson(lastN, firstN, phoneNum);
					cout << actionReturn << endl;
				}

				else if(infoEdit == "last")
				{
					cout << "Enter new last name: ";
					cin >> newLast;
					cout << endl;
					newNum = phoneNum;
					newFirst = firstN;
					actionReturn = editPerson(lastN, firstN, phoneNum);
					cout << actionReturn << endl;
				}
				else
				{
					cout << "Incorrect input. Try again." << endl;
				}

			//actionReturn = editPerson(lastN, firstN);
			//cout << actionReturn << endl;
		}

//6
	else if(userAction == "6") //Display all people in phonebook
		{
		cout << endl << "List of people in phone book: " << endl;
			for(int i=0; i <= increment; i++)
			{
				if(lastName.at(i)== "")
				{
				break;
				}
				else
				{
				cout << lastName.at(i) << "," << firstName.at(i) << " Number: " << phoneNumber.at(i) << endl;
				}
			}
		cout << endl;
		}

//7
	else if(userAction == "7")
		{
			cout << "Closing Phone Book..." << endl; //if 7 is entered, the program will display this message and exit
		}
	else
		{
			cout << endl;
			cout << "Enter a valid action number." << endl << endl;; //in case an invalid number is entered
		}

}

return 0;
}
