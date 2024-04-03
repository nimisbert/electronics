SPICE   = MacSpice
SOURCE  =

CIRCUIT = $(SOURCES:*.cir=)

all: $(CIRCUIT)

%: %.cir 
	$(SPICE) $<