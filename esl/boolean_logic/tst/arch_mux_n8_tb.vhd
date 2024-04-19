library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_mux_n8_tb is 
end entity;

architecture testbench of arch_mux_n8_tb is 

constant NUMBER_OF_BITS : positive := 8;

type pattern_type is record 
    a,b,c,d,e,f,g,h : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
    s : std_logic_vector( 2 downto 0 );
    i : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
end record;
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | a | b | c | d | e | f | g | h | sel | i | 
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "000", "00000001" ),
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "001", "00000010" ),
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "010", "00000100" ),
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "011", "00001000" ),
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "100", "00010000" ),
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "101", "00100000" ),
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "110", "01000000" ),
    ( "00000001", "00000010", "00000100", "00001000", "00010000", "00100000", "01000000", "10000000", "111", "10000000" )
);
procedure check_result(
    p : pattern_type;
    a,b,c,d,e,f,g,h : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
    sel : std_logic_vector ( 2 downto 0 );
    i : std_logic_vector( NUMBER_OF_BITS-1 downto 0 )
    ) is 
    begin 
    assert (p.a = a)   and (p.b = b) and (p.c = c) and (p.d = d) and 
           (p.e = e)   and (p.f = f) and (p.g = g) and (p.h = h) and 
           (p.s = sel) and (p.i = i)
        report "bad result : " & "arch_mux_84"
        severity error;
end procedure; 

signal a,b,c,d,e,f,g,h,i : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
signal sel : std_logic_vector( 2 downto 0 );

begin 
    uut: entity work.arch_mux_n8
         generic map ( n => NUMBER_OF_BITS )
         port map ( a=>a, b=>b, c=>c, d=>d, e=>e, f=>f, g=>g, h=>h, sel=>sel, i=>i );
        
    stim: process
    begin 
        for j in patterns 'range loop
            a <= patterns(j).a; b <= patterns(j).b; c <= patterns(j).c; d <= patterns(j).d;
            e <= patterns(j).e; f <= patterns(j).f; g <= patterns(j).g; h <= patterns(j).h;
            sel <= patterns(j).s;
            wait for 5 ns;
            check_result( patterns(j), a,b,c,d,e,f,g,h,sel,i );
            wait for 5 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;

end architecture;