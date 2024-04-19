library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_or_n_tb is 
end entity;

architecture testbench of arch_or_n_tb is

constant NUMBER_OF_BITS : positive := 16;

type pattern_type is record 
    a : std_logic_vector ( (NUMBER_OF_BITS-1) downto 0 );
    b : std_logic_vector ( (NUMBER_OF_BITS-1) downto 0 );
    c : std_logic_vector ( (NUMBER_OF_BITS-1) downto 0 );
end record;
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := (
    ("0000000000000000", "1111111111111111", "1111111111111111"),
    ("0101010101010101", "0101010110101010", "0101010111111111"),
    ("1111000011110000", "0000111111111111", "1111111111111111"),
    ("1100110011001100", "1010101010101010", "1110111011101110")
);
procedure check_result(
    p : pattern_type;
    a, b, c : std_logic_vector( (NUMBER_OF_BITS-1) downto 0 )
    ) is
    begin
    assert (p.a = a) and (p.b = b) and (p.c = c)
        report "bad result : " & "arch_and_16 output error"
        severity error;
end procedure;

signal a, b, c : std_logic_vector ( NUMBER_OF_BITS-1 downto 0 );

begin 
    uut: entity work.arch_or_n
         generic map( n => NUMBER_OF_BITS )
         port map( a => a, b => b, c=>c );

    stim: process
    begin 
        for i in patterns 'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            wait for 5 ns;
            check_result( patterns(i), a, b, c );
            wait for 5 ns; 
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end architecture;