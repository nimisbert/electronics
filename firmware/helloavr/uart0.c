#include "uart0.h"
#include <avr/io.h>

void uart0_init( unsigned int baudrate ) {
    //DDRD = (1<<PD1);
    UBRR0H = (unsigned char) (baudrate>>8);
    UBRR0L = (unsigned char) (baudrate);
    UCSR0B |= (1<<RXEN0) | (1<<TXEN0); 
    return;
}

void uart0_tx_char( unsigned char data ) {
    while(!(UCSR0A & (1<<UDRE0)));
    UDR0 = data;
}

unsigned char uart0_rx_char( void ) {
    while(!(UCSR0A & (1<<RXC0)));
    return UDR0;
}

void uart0_tx_str( unsigned char *str, int size ) {
    for( int i = 0; i<size; i++ ) {
        uart0_tx_char(str[i]);
    }
}