#include <avr/io.h>
#include <util/delay.h>

#define RED PB0
#define YELLOW PB1
#define GREEN PB2

int main( void ) {
    int state = 0;
    // init io
    DDRB = (1<<PB0) | (1<<PB1) | (1<<PB2);
    while(1) {
        // clear outputs
        PORTB &= ~((1<<RED) | (1<<YELLOW) | (1<<GREEN));
        switch(state) {
            case 0:
                PORTB |= (1<<GREEN);
                _delay_ms(1000);
                state++;
                break;
            case 1:
                PORTB |= (1<<YELLOW);
                _delay_ms(500);
                state++;
                break;
            case 2:
                PORTB |= (1<<RED);
                _delay_ms(1000);
                state++;
                break;
            case 3:
                PORTB |= (1<<YELLOW) | (1<<RED);
                _delay_ms(500);
                state=0;
                break;
            default:
                break;
        }
    }
    return 0;
}