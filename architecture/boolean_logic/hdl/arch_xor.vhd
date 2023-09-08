-- Chip name : Xor
-- Inputs    : a, b
-- Outputs   : c
-- Function  : if a/=b then c=1 else c=0
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_xor is
port(
    a, b : in std_logic;
    c : out std_logic
);
end entity;

architecture behave of arch_xor is 

signal temp : std_logic;

begin
    temp <= ((a nand '1') nand (b nand '1')) nand (a nand b);
    c <= temp nand (temp nand '0');

end architecture;