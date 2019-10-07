
#include "project.h"

int main(void)
{
    CyGlobalIntEnable; 

    

    for(;;)
    {
        Pin_1_Write(1);
        Pin_1_Write(0);
     
     }
}


