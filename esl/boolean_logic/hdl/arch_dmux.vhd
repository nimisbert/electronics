-- Chip name : DMux
-- Inputs    : c, sel
-- Outputs   : a, b
-- Function  : if sel=0 then (a=c, b=0) else (a=0, b=c)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_dmux is 
port(
    c, sel : in std_logic;
    a, b : out std_logic
);
end entity;

architecture behave of arch_dmux is

component arch_and is port ( a, b : in std_logic ; c : out std_logic ); end component;
component arch_not is port ( a : in std_logic ; b : out std_logic );    end component;
-- a = /sel.c
-- b = sel.c

signal sig_not_sel : std_logic;

begin 
    inst_not   : arch_not port map( a => sel, b => sig_not_sel );
    inst_and_1 : arch_and port map( a => c, b => sig_not_sel, c => a ); 
    inst_and_2 : arch_and port map( a => c, b => sel, c => b );

end architecture;