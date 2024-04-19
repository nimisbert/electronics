-- Chip name : Mux
-- Inputs    : a, b, sel
-- Outputs   : c 
-- Function  : if sel=0 then c=a else c=b
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_mux is
port(
    a, b, sel : in std_logic;
    c : out std_logic
);
end entity;

architecture behave of arch_mux is 

component arch_or  is port ( a, b : in std_logic ; c : out std_logic ); end component;
component arch_and is port ( a, b : in std_logic ; c : out std_logic ); end component;
component arch_not is port ( a : in std_logic ; b : out std_logic );    end component;
-- c = a./b./sel + a.b./sel + /a.b.sel + a.b.sel
-- c = /sel.a (/b + b) + sel.b (/a + a)
-- c = /sel.a + sel.b

signal sig_not_sel : std_logic;
signal sig_and_1, sig_and_2 : std_logic;

begin 
    inst_not   : arch_not port map( a => sel, b => sig_not_sel );
    inst_and_1 : arch_and port map( a => sig_not_sel, b => a, c => sig_and_1 ); 
    inst_and_2 : arch_and port map( a => sel, b => b, c => sig_and_2 );
    inst_or    : arch_or  port map( a => sig_and_1, b => sig_and_2, c => c );
    
end architecture;