# hdl compiler 
HDL = ~/ghdl-macos-11-mcode/bin/ghdl 	
# file_tb.vhd
TESTBENCH_FILE_HEADER = _tb			
# working directory is .	
WORKDIR = ./							
# phony clean 
.PHONY: clean 						 	
# *.vhd (hdl) files location
vpath %.vhd $(WORKDIR)hdl $(WORKDIR)tst	

# hdl elaborate and simulate	
%: %.vhd												
	$(HDL) -a $^					
	$(HDL) -e $@$(TESTBENCH_FILE_HEADER)				 
	$(HDL) -r $@$(TESTBENCH_FILE_HEADER)

# logic gate [not] using [nand] gates
arch_not: arch_not.vhd arch_not_tb.vhd
# logic gate [and] using [nand] gates
arch_and: arch_and.vhd arch_and_tb.vhd 
# logic gate [or] using [nand] gates
arch_or: arch_or.vhd arch_or_tb.vhd
# logic gate [xor] using [nand] gates 
arch_xor: arch_xor.vhd arch_xor_tb.vhd
# logic gate [mux] using [nand] gates
arch_mux: arch_mux.vhd arch_mux_tb.vhd
# logic gate [dmux] using [nand] gates
arch_dmux: arch_dmux.vhd arch_dmux_tb.vhd
# logic gate array [arch_not_n]
arch_not_n: arch_not_n.vhd arch_not_n_tb.vhd

clean: 
	rm -f *.cf