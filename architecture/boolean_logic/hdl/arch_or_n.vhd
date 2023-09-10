-- Chip name : Or n-bit
-- Inputs    : a[n], b[n]
-- Outputs   : c[n] 
-- Function  : for i=0..n-1 c[i] = a[i] + b[i]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_or_n is 
generic ( n : positive );
port(
    a,b : in  std_logic_vector (n-1 downto 0);
    c : out std_logic_vector (n-1 downto 0)
);  
end entity;

architecture behave of arch_or_n is 

component arch_or is port ( a,b : in std_logic ; c : out std_logic ); end component;

begin
    ors : for i in 0 to n-1 generate
        ori : arch_or port map ( a(i), b(i), c(i) ); 
    end generate;
end architecture;