-- Chip name : Mux n-bits 4-way
-- Inputs    : a[n], b[n], c[n], d[n],
--             e[n], f[n], g[n], h[n],
--             sel[3]
-- Output    : i[n]
-- Function  : if      sel=000 then i=a
--             else if sel=001 then i=b
--             ...
--             else if sel=111 then i=h
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_mux_n8 is
generic( n : positive );
port(
    a,b,c,d,e,f,g,h : in std_logic_vector ( n-1 downto 0 );
    sel : in std_logic_vector( 2 downto 0 );
    i : out std_logic_vector ( n-1 downto 0 )
);
end entity;

architecture behave of arch_mux_n8 is 

begin 
    process (sel)
    begin 
        for j in 0 to n-1 loop 
            if( sel = "000" )then
                i(j) <= a(j);
            elsif( sel = "001" )then
                i(j) <= b(j);
            elsif( sel = "010" )then
                i(j) <= c(j);
            elsif( sel = "011" )then 
                i(j) <= d(j);
            elsif( sel = "100" )then 
                i(j) <= e(j);
            elsif( sel = "101" )then 
                i(j) <= f(j);
            elsif( sel = "110" )then 
                i(j) <= g(j);
            else 
                i(j) <= h(j);
            end if;
        end loop;
    end process;
end architecture;