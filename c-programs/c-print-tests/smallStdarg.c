#include <stdlib.h>
#include <stdarg.h>     /* for va_ stuff */

void printargs(int arg1, ...) { /* print all int type args, finishing with -1 */
    va_list ap;
    va_start(ap, arg1); 
    
    for (int i = arg1; i != -1; i = va_arg(ap, int)) { }
    
    va_end(ap);
} 

int main(void) {
    printargs(5, 2, 14, 84, 97, 15, 24, 48, -1);
    printargs(84, 51, -1);
    printargs(-1);
    printargs(1, -1);

    return 0;
}
