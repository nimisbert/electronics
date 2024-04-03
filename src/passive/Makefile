SPICE   = MacSpice

SOURCE  = div.cir \
		  highpass.cir \
		  lowpass.cir \
		  notch.cir

CIRCUIT = $(SOURCES:*.cir=)

all: $(CIRCUIT)

%: %.cir 
	$(SPICE) $<