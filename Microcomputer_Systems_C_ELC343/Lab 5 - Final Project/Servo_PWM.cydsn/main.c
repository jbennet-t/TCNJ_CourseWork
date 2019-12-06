//Microcomputer Systems Final Project
//Jordan Sinoway & Caleb McKinney - Fall 2019

#include "project.h"

int main(void)
{
    CyGlobalIntEnable; 
    
    PWM_1_Start();
    
    int val;
    
      

    for(;;)
    {
        
        val = 2000;
        PWM_1_WriteCompare(val);
        CyDelay(500);
        
        val = 1000;
        PWM_1_WriteCompare(val);
        CyDelay(500);
    }
}


