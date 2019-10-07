/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date:        10/9/2017

 Course: CSC-215
 File:  speedOfLight.cpp
 Rev #: 1.1
 Description: This program calculates the amount of time a beam of light
 would take to travel a distance provided by the user.
 ============================================================*/

#include <iostream>
#include <math.h> // < Needed for using fmod to calculate the remainder of a double
using namespace std;

int main(void) {
double dMiles = 0.0;
double dKilometers = 0.0;
double dMeters = 0.0;
double timeSeconds = 0.0;
double timeMinutes = 0.0;
int timeHours = 0;
double extraMinutes = 0.0;

cout << "Enter a distance in millions of miles (123 = 123,000,000) to calculate the time " << endl;
cin >> dMiles;
dMiles = dMiles * 1000000;
dKilometers = dMiles * 1.60934;
dMeters = dKilometers * 1000;
timeSeconds = dMeters/299792458;
timeMinutes = timeSeconds/60;
timeHours = timeMinutes/60;

extraMinutes = fmod(timeMinutes,60); //couldn't use modulo on a double, so I used fmod instead

cout << "The time to travel " << dMiles << " miles is " << timeHours << " hour(s) and " << extraMinutes << " minutes" << endl;


    return 0;
}
