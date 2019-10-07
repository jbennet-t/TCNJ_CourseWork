#include "project.h"

int main(void)
{
    CyGlobalIntEnable; 
    
    int32_t sum;// running sum, zero it out each 100,000 samples
    int32_t saved_mean;// gets sum/N at the end of each batch
    int64_t sum_of_sqs;// running sum of (f(n) -saved_mean)2
    int32_t min;// capture min(f(n)) reset to INT_MAX each batch
    int32_t max;// capture max(f(n)) reset to INT_MIN each batch
    

    for(;;)
    {
        sum = 0;
        min = 0;
        max = 0;
        
        
    }
}


