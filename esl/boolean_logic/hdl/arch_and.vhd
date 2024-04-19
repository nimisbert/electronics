-- Chip name : And
-- Inputs    : a, b 
-- Outputs   : c
-- Function  : if a=b=1 then c=1 else c=0
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_and is 
port(
    a, b : in std_logic;
    c : out std_logic
);
end entity;

architecture behave of arch_and is 

begin 
    c <= (a nand b) nand (a nand b);
end architecture;