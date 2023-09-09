-- Chip name : Not n-bit
-- Inputs    : a[n] // n-bit array
-- Outputs   : b[n] 
-- Function  : for i=0..n-1 b[i] = /a[i]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_not_n is 
generic ( n : positive );
port(
    a : in  std_logic_vector (n-1 downto 0);
    b : out std_logic_vector (n-1 downto 0)
);  
end entity;

architecture behave of arch_not_n is 

component arch_not is port ( a : in std_logic ; b : out std_logic ); end component;

begin
    nots : for i in 0 to n-1 generate
        noti : arch_not port map ( a(i), b(i) ); 
    end generate;
end architecture;