HDL = ~/ghdl-macos-11-mcode/bin/ghdl 	# hdl compiler 
TESTBENCH_FILE_HEADER = _tb				# file_tb.vhd
WORKDIR = ./							# working directory is .

.PHONY: clean 						 	# phony clean 
vpath %.vhd $(WORKDIR)hdl $(WORKDIR)tst	# *.vhd (hdl) files location

%: %.vhd								# hdl elaborate and simulation 						
	$(HDL) -a $^					
	$(HDL) -e $@$(TESTBENCH_FILE_HEADER)				 
	$(HDL) -r $@$(TESTBENCH_FILE_HEADER)

arch_not: arch_not.vhd arch_not_tb.vhd 	# logic gate [not] using [nand] gates

clean: 
	rm -f *.cf