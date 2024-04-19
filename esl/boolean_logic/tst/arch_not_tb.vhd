library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_not_tb is 
end entity;

architecture testbench of arch_not_tb is

type pattern_type is record
    a, b : std_logic;
end record;

type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | a | b | not gate patterns 
    ('0', '1'),                        -- | 0 | 1 |
    ('1', '0')                         -- | 1 | 0 |
);

procedure check_result ( 
    p : pattern_type; -- expected results 
    a : std_logic;    -- uut input 
    b : std_logic     -- uut output 
    ) is 
    begin 
    assert (p.a = a) and (p.b = b)
        report "bad result : "
            & "not "
            & std_logic 'image(a)
            & " gave "
            & std_logic 'image(b)
            & " expected "
            & std_logic 'image(p.b)
        severity error;
end procedure;

signal a, b : std_logic;

begin
    uut: entity work.arch_not port map( a => a, b => b );

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