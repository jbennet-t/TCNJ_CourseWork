#include "project.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdint.h>

int main(void)
{
    // 4.1 ACCESS REGISTER VIA ITS ADDRESS
    //---------------------------------------------------
    
    //variable declarations
    uint32_t implementer;
    uint32_t variant;
    uint32_t partno;
    uint32_t revision;
    uint32_t reg_val;
    char myname[] = "Jordan Bennett Sinoway";
    char temp;
    int length = 0;
    int i = 0;
    int j = 0;
      
    #define NVIC_CPUID_BASE_ADDR 0xE000ED00 //macro to hold register address
    
    uint32_t volatile * my_reg_ptr; //declaring pointer to a volatile unsigned int
    my_reg_ptr = (uint32_t *) NVIC_CPUID_BASE_ADDR; //set pointer to point to register of this address
    reg_val = *my_reg_ptr; //get value in register
    
    implementer = (reg_val >> 24) & 0xFF; //implementer occupies [31:24], right shifting to remove excess bits, anding with 0xFF to isolate
    reg_val = *my_reg_ptr; //reseting reg_val to register value, so that operation can be performed again
    variant = (reg_val >> 20) & 0xF; //variant occupies [23:20], " "
    reg_val = *my_reg_ptr;
    partno = (reg_val >> 4) & 0xFFFF; //partno occupies [19:4], " "
    reg_val = *my_reg_ptr;
    revision = (reg_val) & 0xF; //revision occupies [3:0], " "
    reg_val = *my_reg_ptr; 
    //---------------------------------------------------
    
    
    // 4.2 MANIPULATE A CHARACTER STRING
    
    for(i = 0; myname[i] != '\0'; i++)  //finds length of string, stores it to length
    {
        length = i;
    }
    
    for(i=0; i<length; i++) //bubble sort for string myname
    {
        for(j=i+1; j<length; j++) 
        {
            if(myname[i] > myname[j]) //if the hex val of char for [i] is > than [j], keep sorting 
            {
                temp = myname[i]; //temp variable to store myname[i]
                myname[i] = myname[j]; //swapping the two chars
                myname[j] = temp; 
            }
        }
        
    }

    //---------------------------------------------------
    
    
    for(;;) //not used for this assignment
    {}
}
