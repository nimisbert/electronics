-- Chip name : Dmux 1-bit 4-way
-- Input     : a, sel[2] 
-- Outputs   : b,c,d,e
-- Function  : if      sel=00 then (b=a, c=d=e=0)
--             else if sel=01 then (c=a, b=d=e=0)
--             else if sel=10 then (d=a, b=c=e=0)
--             else if sel=11 then (e=a, b=c=d=0)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_dmux_4 is 
port(
    a : in std_logic;
    sel : in std_logic_vector( 1 downto 0 );
    b,c,d,e : out std_logic
);
end entity;

architecture behave of arch_dmux_4 is 

begin
    process (sel)
    begin
        if( sel = "00" )then 
            b <= a;
            c <= '0';
            d <= '0';
            e <= '0';
        elsif( sel = "01" )then
            b <= '0';
            c <= a;
            d <= '0';
            e <= '0';
        elsif( sel = "10" )then 
            b <= '0';
            c <= '0';
            d <= a;
            e <= '0';
        else
            b <= '0';
            c <= '0';
            d <= '0';
            e <= a;
        end if;
    end process;
end architecture;        