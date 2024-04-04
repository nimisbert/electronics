SPICE = ngspice

SOURCE = div.cir 	  \
		 highpass.cir \
		 lowpass.cir  \
		 bandpass.cir \
		 notch.cir

CIRCUIT = $(SOURCE:.cir=)

all: $(CIRCUIT)

%: %.cir 
	$(SPICE) $<