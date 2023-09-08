-- Chip name : Or
-- Inputs    : a, b
-- Outputs   : c 
-- Function  : if a=b=0 then c=0 else c=1
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_or is 
port(
    a, b : in std_logic;
    c : out std_logic
);
end entity;

architecture behave of arch_or is 

begin
    c <= (a nand a) nand (b nand b);

end architecture;