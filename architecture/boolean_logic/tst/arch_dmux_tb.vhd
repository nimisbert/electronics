library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_dmux_tb is 
end entity;

architecture testbench of arch_dmux_tb is

type pattern_type is record 
    c, sel : std_logic;
    a, b : std_logic;
end record;

type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | c | sel | a | b | dmux gate pattern
    ('0', '0', '0', '0'),           
    ('0', '1', '0', '0'), 
    ('1', '0', '1', '0'),   
    ('1', '1', '0', '1')          
);

procedure check_result(
    p : pattern_type; -- expected pattern
    c, sel, a, b : std_logic
    ) is 
    begin 
    assert (p.a = a) and (p.b = b) and (p.sel = sel) and (p.c = c) report 
          "bad result : "
        & "arch_mux (" 
        & std_logic 'image(c) & " , " & std_logic 'image(sel) & ")"
        & " gave ("
        & std_logic 'image(a) & "," & std_logic 'image(b) & ")"
        & " expected ("
        & std_logic 'image(p.a) & "," & std_logic 'image(p.b) & ")"
    severity error;
end procedure;

signal a, b, sel, c : std_logic;

begin
    uut: entity work.arch_dmux port map( c=>c, sel=>sel, a=>a, b=>b );
    stim: process
    begin
        for i in patterns 'range loop
            c <= patterns(i).c;
            sel <= patterns(i).sel;
            wait for 5 ns;
            check_result( patterns(i), c, sel, a, b );
            wait for 5 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end architecture;