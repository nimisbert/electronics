-- Chip name : Not
-- Inputs    : a
-- Outputs   : b
-- Function  : if ( a = 0 ) then ( b = 1 ) else ( b = 0 )
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_not is 
port( 
    a : in  std_logic;
    b : out std_logic
);
end entity;

architecture behave of arch_not is
begin 
    b <= a nand (a nand '0');
end architecture;