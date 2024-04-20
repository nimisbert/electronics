#ifndef UART0_CONFIG_H
#define UART0_CONFIG_H

void uart0_init( unsigned int baudrate );

void uart0_tx_char( unsigned char data );
void uart0_tx_str( unsigned char *str, int size );

unsigned char uart0_rx_char( void );


#endif