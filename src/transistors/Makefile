SPICE   = MacSpice
SOURCE  =

CIRCUIT = $(SOURCE:.cir=)

all: $(CIRCUIT)

%: %.cir 
	$(SPICE) $<