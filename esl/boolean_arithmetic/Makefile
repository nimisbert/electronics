HDL = ~/ghdl-macos-11-mcode/bin/ghdl 	
BOOLEAN_LOGIC_DIR = ../boolean_logic/
WORK_DIR = ./
TESTBENCH_FILE_HEADER = _tb	
HDL_IMPORT_FLAGS = -i --workdir=$(WORK_DIR)
HDL_DISPLAY_FLAGS = -d --workdir=$(WORK_DIR)

vpath %.vhd $(WORK_DIR)hdl $(WORK_DIR)tst	
.PHONY: import display clean

%: %.vhd											
	$(HDL) -a $^					
	$(HDL) -e $@$(TESTBENCH_FILE_HEADER)				 
	$(HDL) -r $@$(TESTBENCH_FILE_HEADER)

# unit-test, must do "$ make import" command before 
arch_half_adder: arch_half_adder.vhd arch_half_adder_tb.vhd

# import boolean logic to boolean arithmetic work
import:
	$(HDL) $(HDL_IMPORT_FLAGS) $(BOOLEAN_LOGIC_DIR)hdl/*.vhd

# displays entity in work
display:
	$(HDL) $(HDL_DISPLAY_FLAGS)

clean: 
	rm -f *.cf