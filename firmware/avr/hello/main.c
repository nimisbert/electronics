#include "uart0.h"
#include <avr/io.h>

#define FOSC 1843200
#define BAUDRATE 9600
#define MYUBRR FOSC/16/BAUDRATE-1

int main( void ) {
    uart0_init( MYUBRR );
    uart0_tx_str( "Hello AVR World!\r\n", 19 );
    return 0;
}