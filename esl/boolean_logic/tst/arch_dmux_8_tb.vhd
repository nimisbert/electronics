library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_dmux_8_tb is 
end entity;

architecture testbench of arch_dmux_8_tb is 

type pattern_type is record 
    a : std_logic;
    s : std_logic_vector( 2 downto 0 );
    b,c,d,e,f,g,h,i : std_logic;
end record;
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | a | sel | b | c | d | e | f | g | h | i |
    ( '1', "000", '1', '0', '0', '0', '0', '0', '0', '0'), 
    ( '1', "001", '0', '1', '0', '0', '0', '0', '0', '0'), 
    ( '1', "010", '0', '0', '1', '0', '0', '0', '0', '0'), 
    ( '1', "011", '0', '0', '0', '1', '0', '0', '0', '0'), 
    ( '1', "100", '0', '0', '0', '0', '1', '0', '0', '0'), 
    ( '1', "101", '0', '0', '0', '0', '0', '1', '0', '0'), 
    ( '1', "110", '0', '0', '0', '0', '0', '0', '1', '0'), 
    ( '1', "111", '0', '0', '0', '0', '0', '0', '0', '1')

);
procedure check_result(
    p : pattern_type;
    a : std_logic;
    sel : std_logic_vector( 2 downto 0 );
    b,c,d,e,f,g,h,i : std_logic 
    ) is 
    begin 
    assert (p.a=a) and (p.s = sel) and 
           (p.b = b) and (p.c = c) and (p.d = d) and (p.e = e) and 
           (p.f = f) and (p.g = g) and (p.h = h) and (p.i = i)
        report "bad result : " & "arch_dmux_8"
        severity error;
end procedure;

signal a,b,c,d,e,f,g,h,i : std_logic;
signal sel : std_logic_vector (2 downto 0);

begin
    uut: entity work.arch_dmux_8 
         port map( a, sel, b, c, d, e, f, g, h, i );

    stim: process
    begin 
        for j in patterns 'range loop 
            a <= patterns(j).a;
            sel <= patterns(j).s;
            wait for 5 ns;
            check_result( patterns(j), a,sel, b,c,d,e, f,g,h,i );
            wait for 5 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;

end architecture;