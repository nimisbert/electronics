SPICE   = ngspice
SOURCE  = led_drive.cir 

CIRCUIT = $(SOURCE:.cir=)

all: $(CIRCUIT)

%: %.cir 
	$(SPICE) $<