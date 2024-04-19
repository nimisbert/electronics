-- Chip name : Mux n-bits 4-way
-- Input     : a[n], b[n], c[n], d[n], sel[2]
-- Output    : e[n]
-- Function  : if      sel=00 then e=a
--             else if sel=01 then e=b
--             else if sel=10 then e=c
--             else           then e=d
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_mux_n4 is
generic( n : positive );
port(
    a,b,c,d : in std_logic_vector ( n-1 downto 0 );
    sel : in std_logic_vector( 1 downto 0 );
    e : out std_logic_vector ( n-1 downto 0 )
);
end entity;

architecture behave of arch_mux_n4 is 

begin 
    process (sel)
    begin 
        for i in 0 to n-1 loop 
            if( sel = "00" )then
                e(i) <= a(i);
            elsif( sel = "01" )then
                e(i) <= b(i);
            elsif( sel = "10" )then
                e(i) <= c(i);
            else
                e(i) <= d(i);
            end if;
        end loop;
    end process;
end architecture;