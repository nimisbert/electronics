-- Chip name : Mux n-bit
-- Inputs    : a[n], b[n], sel
-- Outputs   : c[n]
-- Function  : if sel=0 then for i=0..15 c[i]=a[i]
--             else for i=0..15 c[i]=b[i]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_mux_n is 
generic( n : positive );
port( 
    a,b : in std_logic_vector (n-1 downto 0);
    sel : in std_logic;
    c : out std_logic_vector (n-1 downto 0)
);
end entity;

architecture behave of arch_mux_n is 

component arch_mux is port( a, b, sel : in std_logic; c : out std_logic ); end component;

begin 
    muxs: for i in 0 to n-1 generate
        muxi : arch_mux port map( a=>a(i), b=>b(i), sel=>sel, c=>c(i) );
    end generate;

end architecture;