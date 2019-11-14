#include "build_plot_str.h"

/*
    Procedure:
        build_plot_str
    
    Behavior:
        For two input values (assumed scale factor is +/-32768) builds a string
        where the values are plotting using characters 'x' and '+', assuming 64-character
        wide terminal
    
    Inputs:
        msg_str: pointer to the string where the output will be placed.  Must be allocated to be at least 65 characters long.
    
        x:       first value to be plotted (with character 'x')
        y:       second value to be plotted (with character '+')
        
    Outputs:
        None
*/
void build_plot_str( char str[], int x, int y )
{
    memset(str, ' ', 64);                       // sets string to sppaces
    str[64] = '\r';                             // carriage return
    str[65] = '\n';                             // line feed
    str[66] = '\0';                             // NULL termination
    str[32] = '|';                              // Draw the axis line
    
    x = x >> 10;                                // Remaps to range +/-32
    x = x + 32;                                 // Remaps to range 0..63
    if (x < 0) x = 0;       if (x > 63) x = 63; // Clip to range 0..64
    
    y = y >> 10;                                // Remaps to range +/-32
    y = y + 32;                                 // Remaps to range 0..63
    if (y < 0) y = 0;       if (y > 63) y = 63; // Clip to range 0..64

    // Special case x = y, draw '*'
    if (x == y)
        str[x] = '*';
    else
    {
        str[x] = 'x';
        str[y] = '+';
    }
}
        