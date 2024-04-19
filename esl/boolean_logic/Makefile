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

# unit-test
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
# logic gate array [arch_not_n] (n-bit input to n-bit output : multi-bit)
arch_not_n: arch_not_n.vhd arch_not_n_tb.vhd
# logic gate array [arch_and_n] (n-bit inputs to n-bit output : multi-bit)
arch_and_n: arch_and_n.vhd arch_and_n_tb.vhd
# logic gate array [arch_or_n] (n-bit inputs to n-bit output : multi-bit)
arch_or_n: arch_or_n.vhd arch_or_n_tb.vhd 
# logic gate array [arch_mux_n] (n-bit inputs to n-bit output : multi-bit)
arch_mux_n: arch_mux_n.vhd arch_mux_n_tb.vhd
# logic gate [arch_or_m] (m-way input to 1-bit output : multi-way)
arch_or_m: arch_or_m.vhd arch_or_m_tb.vhd 
# logic gate [arch_and_m] (m-way input to 1-bit output : mutli-way)
arch_and_m: arch_and_m.vhd arch_and_m_tb.vhd
# logic gate [arch_mux_n4] (4-way n-bit mux : multi-bit & multi-way)
arch_mux_n4: arch_mux_n4.vhd arch_mux_n4_tb.vhd
# logic gate [arch_mux_n8] (8-way n-bit mux : multi-bit & multi-way)
arch_mux_n8: arch_mux_n8.vhd arch_mux_n8_tb.vhd
# logic gate [arch_dmux_4] (4-way 1-bit dmux : multi-way)
arch_dmux_4: arch_dmux_4.vhd arch_dmux_4_tb.vhd
# logic gate [arch_dmux_8] (8-way 1-bit dmux : multi-way)
arch_dmux_8: arch_dmux_8.vhd arch_dmux_8_tb.vhd

clean: 
	rm -f *.cf