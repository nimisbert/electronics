library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_and_m_tb is 
end entity;

architecture testbench of arch_and_m_tb is

constant NUMBER_OF_BITS : positive := 16;

type pattern_type is record 
    a : std_logic_vector ( (NUMBER_OF_BITS-1) downto 0 );
    b : std_logic;
end record;
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := (
    ("1111111111111111", '1'),
    ("1000000000000000", '0'),
    ("0000000000000001", '0'),
    ("1100110011001100", '0')
);
procedure check_result(
    p : pattern_type;
    a : std_logic_vector( (NUMBER_OF_BITS-1) downto 0 );
    b : std_logic
    ) is
    begin
    assert (p.a = a) and (p.b = b)
        report "bad result : " & "arch_and_16_way output error"
        severity error;
end procedure;

signal a : std_logic_vector ( NUMBER_OF_BITS-1 downto 0 );
signal b : std_logic;

begin 
    uut: entity work.arch_and_m
         generic map( m => NUMBER_OF_BITS )
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