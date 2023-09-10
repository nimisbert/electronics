library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_mux_n4_tb is 
end entity;

architecture testbench of arch_mux_n4_tb is 

constant NUMBER_OF_BITS : positive := 4;

type pattern_type is record 
    a,b,c,d : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
    s : std_logic_vector( 1 downto 0 );
    e : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
end record;
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | a | b | c | d | sel | e | 
    ( "0001", "0010", "0100", "1000", "00", "0001" ),
    ( "0001", "0010", "0100", "1000", "01", "0010" ),
    ( "0001", "0010", "0100", "1000", "10", "0100" ),
    ( "0001", "0010", "0100", "1000", "11", "1000" )
);
procedure check_result(
    p : pattern_type;
    a,b,c,d : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
    sel : std_logic_vector ( 1 downto 0 );
    e : std_logic_vector( NUMBER_OF_BITS-1 downto 0 )
    ) is 
    begin 
    assert (p.a = a) and (p.b = b) and (p.c = c) and (p.d = d) and (p.s = sel) and (p.e = e)
        report "bad result : " & "arch_mux_84"
        severity error;
end procedure; 

signal a,b,c,d,e : std_logic_vector( NUMBER_OF_BITS-1 downto 0 );
signal sel : std_logic_vector( 1 downto 0 );

begin 
    uut: entity work.arch_mux_n4
         generic map ( n => NUMBER_OF_BITS )
         port map ( a=>a, b=>b, c=>c, d=>d, sel=>sel, e=>e );
        
    stim: process
    begin 
        for i in patterns 'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            c <= patterns(i).c;
            d <= patterns(i).d;
            sel <= patterns(i).s;
            wait for 5 ns;
            check_result( patterns(i), a,b,c,d,sel,e );
            wait for 5 ns;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;

end architecture;