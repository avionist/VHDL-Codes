library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dc_tb is
end dc_tb;

architecture darch of dc_tb is
signal clk,rst: std_logic:='0';
signal s,m,h: std_logic_vector(5 downto 0);
component digiclk
port(
	clk,rst: in std_logic;
	sec,min,hr: out std_logic_vector(5 downto 0)
);
end component;
begin 
dut: digiclk port map (
clk => clk,
rst => rst,
sec => s,
min => m,
hr => h
);

clk <= not clk after 0.5 ms;

process
begin
rst <= '0' ;
wait for 100 ns;
rst <= '1';
end process;
end darch;
