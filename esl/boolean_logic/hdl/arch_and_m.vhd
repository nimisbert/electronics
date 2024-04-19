-- Chip name : And m-way
-- Input     : a[m]
-- Output    : b
-- Function  : b = a[0] . a[1] . .. . a[m-1]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_and_m is
generic( m : positive );
port(
    a : in std_logic_vector (m-1 downto 0);
    b : out std_logic
);
end entity;

architecture behave of arch_and_m is 

component arch_and is port( a,b : in std_logic ; c : out std_logic ); end component;
signal sig_temp : std_logic_vector( (m-2) downto 0 );

begin
    and0 : arch_and port map ( a=>a(0), b=>a(1), c=>sig_temp(0) );
    ands : for i in 2 to m-1 generate 
        andi : arch_and port map( a=>a(i), b=>sig_temp(i-2), c=>sig_temp(i-1) );
    end generate;
    b <= sig_temp(m-2);
    
end architecture;