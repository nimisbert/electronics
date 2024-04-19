library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_dmux_4_tb is 
end entity;

architecture testbench of arch_dmux_4_tb is 

type pattern_type is record 
    a : std_logic;
    s : std_logic_vector( 1 downto 0 );
    b,c,d,e : std_logic;
end record;
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | a | sel | b | c | d | e |
    ( '1', "00", '1', '0', '0', '0'), 
    ( '1', "01", '0', '1', '0', '0'), 
    ( '1', "10", '0', '0', '1', '0'), 
    ( '1', "11", '0', '0', '0', '1')
);
procedure check_result(
    p : pattern_type;
    a : std_logic;
    sel : std_logic_vector( 1 downto 0 );
    b,c,d,e : std_logic 
    ) is 
    begin 
    assert (p.a=a) and (p.s = sel) and 
           (p.b = b) and (p.c = c) and (p.d = d) and (p.e = e)
        report "bad result : " & "arch_dmux_4"
        severity error;
end procedure;

signal a,b,c,d,e : std_logic;
signal sel : std_logic_vector (1 downto 0);

begin
    uut: entity work.arch_dmux_4 
         port map( a, sel, b, c, d, e );

    stim: process
    begin 
        for j in patterns 'range loop 
            a <= patterns(j).a;
            sel <= patterns(j).s;
            wait for 5 ns;
            check_result( patterns(j), a,sel, b,c,d,e );
            wait for 5 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;

end architecture;