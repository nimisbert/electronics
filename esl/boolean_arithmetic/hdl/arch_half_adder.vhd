-- Chip name : Half-adder
-- Inputs    : a,b
-- Outputs   : s(sum), c(carry)
-- Function  : s = LSB of a + b
--             c = MSB of a + b
-- where + operator is the arithmetic addition not the boolean or

library ieee;
use ieee.std_logic_1164.all;

entity arch_half_adder is
port(
    a, b : in std_logic;
    s, c : out std_logic
);
end entity;

architecture behave of arch_half_adder is 

component arch_and is port ( a, b : in std_logic ; c : out std_logic ); end component;
component arch_xor is port ( a, b : in std_logic ; c : out std_logic ); end component;

begin 
    carry: arch_and port map( a=>a, b=>b, c=>c );
    sum:   arch_xor port map( a=>a, b=>b, c=>c ); 

end architecture;