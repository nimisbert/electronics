library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_mux_tb is 
end entity;

architecture testbench of arch_mux_tb is

type pattern_type is record 
    a, b, sel : std_logic;
    c : std_logic;
end record;

type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | a | b | sel | c | mux gate pattern
    ('0', '0', '0', '0'),           
    ('0', '1', '0', '0'), 
    ('1', '0', '0', '1'),   
    ('1', '1', '0', '1'),  
    ('0', '0', '1', '0'),  
    ('0', '1', '1', '1'),  
    ('1', '0', '1', '0'),  
    ('1', '1', '1', '1')                  
);

procedure check_result(
    p : pattern_type; -- expected pattern
    a, b, sel, c : std_logic
    ) is 
    begin 
    assert (p.a = a) and (p.b = b) and (p.sel = sel) and (p.c = c)
        report "bad result : "
            & "arch_mux (" 
            & std_logic 'image(a)
            & " , "
            & std_logic 'image(b)
            & " , "
            & std_logic 'image(sel)
            & ") gave "
            & std_logic 'image(c)
            & " expected "
            & std_logic 'image(p.c)
        severity error;
end procedure;

signal a,b,sel,c : std_logic;

begin
    uut: entity work.arch_mux port map( a=>a, b=>b, sel => sel, c=>c );
    stim: process
    begin
        for i in patterns 'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            sel <= patterns(i).sel;
            wait for 5 ns;
            check_result( patterns(i), a, b, sel, c );
            wait for 5 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end architecture;