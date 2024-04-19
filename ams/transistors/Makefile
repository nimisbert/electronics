SPICE   = ngspice
SOURCE  = led_drive.cir \
	 	  switching_load_a.cir

CIRCUIT = $(SOURCE:.cir=)

all: $(CIRCUIT)

%: %.cir 
	$(SPICE) $<