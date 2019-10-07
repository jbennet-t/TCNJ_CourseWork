
#include "project.h"

int main(void)
{
    CyGlobalIntEnable; 

   
    for(;;)
    {
        
        LED1_Write(0);
        CyDelay(500);
        LED1_Write(1);
        CyDelay( 500);
        
        LED2_Write( ~Button1_Read() );
        
        
    }
    
    
}



