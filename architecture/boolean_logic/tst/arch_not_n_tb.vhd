library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_not_n_tb is 
end entity;

architecture testbench of arch_not_n_tb is

constant NUMBER_OF_BITS : positive := 16;

type pattern_type is record 
    a : std_logic_vector ( (NUMBER_OF_BITS-1) downto 0 );
    b : std_logic_vector ( (NUMBER_OF_BITS-1) downto 0 );
end record;
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := (
    ("0000000000000000", "1111111111111111"),
    ("0101010101010101", "1010101010101010"),
    ("1111000011110000", "0000111100001111"),
    ("0000000011111111", "1111111100000000")
);
procedure check_result(
    p : pattern_type;
    a, b : std_logic_vector( (NUMBER_OF_BITS-1) downto 0 )
    ) is
    begin
    assert (p.a = a) and (p.b = b) 
        report "bad result : " & "arch_not_16 output error"
        severity error;
end procedure;

signal a, b : std_logic_vector ( NUMBER_OF_BITS-1 downto 0 );

begin 
    uut: entity work.arch_not_n
         generic map( n => NUMBER_OF_BITS )
         port map( a => a, b => b );

    stim: process
    begin 
        for i in patterns 'range loop
            a <= patterns(i).a;
            wait for 5 ns;
            check_result( patterns(i), a, b );
            wait for 5 ns; 
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end architecture;