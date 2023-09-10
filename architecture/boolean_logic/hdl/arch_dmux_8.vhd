-- Chip name : Dmux 1-bit 8-way
-- Input     : a, sel[3] 
-- Outputs   : b,c,d,e, f,g,h,i
-- Function  : if      sel=000 then (b=a, others=0)
--             else if sel=001 then (c=a, others=0)
--             else if sel=010 then (d=a, others=0)
--             ...
--             else if sel=111 then (i=a, others=0)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arch_dmux_8 is 
port(
    a : in std_logic;
    sel : in std_logic_vector( 2 downto 0 );
    b,c,d,e,f,g,h,i : out std_logic
);
end entity;

architecture behave of arch_dmux_8 is 

begin
    process (sel)
    begin
        if   ( sel = "000" )then 
            b <=  a ; c <= '0'; d <= '0'; e <= '0';
            f <= '0'; g <= '0'; h <= '0'; i <= '0'; 
        elsif( sel = "001" )then
            b <= '0'; c <=  a ; d <= '0'; e <= '0';
            f <= '0'; g <= '0'; h <= '0'; i <= '0'; 
        elsif( sel = "010" )then
            b <= '0'; c <= '0'; d <=  a ; e <= '0';
            f <= '0'; g <= '0'; h <= '0'; i <= '0'; 
        elsif( sel = "011" )then
            b <= '0'; c <= '0'; d <= '0'; e <=  a ;
            f <= '0'; g <= '0'; h <= '0'; i <= '0'; 
        elsif( sel = "100" )then
            b <= '0'; c <= '0'; d <= '0'; e <= '0';
            f <=  a ; g <= '0'; h <= '0'; i <= '0'; 
        elsif( sel = "101" )then
            b <= '0'; c <= '0'; d <= '0'; e <= '0';
            f <= '0'; g <=  a ; h <= '0'; i <= '0'; 
        elsif( sel = "110" )then
            b <= '0'; c <= '0'; d <= '0'; e <= '0';
            f <= '0'; g <= '0'; h <=  a ; i <= '0'; 
        else 
            b <= '0'; c <= '0'; d <= '0'; e <= '0';
            f <= '0'; g <= '0'; h <= '0'; i <=  a ; 
            
        end if;
    end process;
end architecture;        