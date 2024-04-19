library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_and_tb is
end entity;

architecture testbench of arch_and_tb is 

type pattern_type is record
    a, b : std_logic;
    c : std_logic;
end record;

type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array := ( -- | a | b | c | and gate patterns
    ('0', '0', '0'),                   -- | 0 | 0 | 0 |
    ('0', '1', '0'),                   -- | 0 | 1 | 0 |
    ('1', '0', '0'),                   -- | 1 | 0 | 0 |
    ('1', '1', '1')                    -- | 1 | 1 | 1 |
);

procedure check_result( 
    p : pattern_type; -- expected pattern
    a, b, c : std_logic -- uut I/O
    ) is 
    begin 
    assert (p.a = a) and (p.b = b) and (p.c = c)
        report "bad result : "
            & "arch_and (" & std_logic 'image(b) & "," & std_logic 'image(a) & ")"
            & " gave "
            & std_logic 'image(c)
            & " expected "
            & std_logic 'image(p.c)
        severity error;
end procedure;

signal a,b,c : std_logic;

begin
    uut: entity work.arch_and port map( a=>a, b=>b, c=>c );

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