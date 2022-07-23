library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity digiclk is
port (
	clk,rst: in std_logic;
	sec,min,hr: out std_logic_vector(5 downto 0)
);
end digiclk;

architecture dc_arch of digiclk is
signal s,m,h: std_logic_vector(5 downto 0):="000000";
signal cntr: integer:=0;
begin
process (clk,rst)
	begin
	if rst='1' then
	s<="000000";
	m<="000000";
	h<="000000";
	else if (rising_edge(clk)) then
	cntr <= cntr + 1;
	if(cntr=1000) then
	s<=s+'1';
	cntr <= 0;
		if (s="111011") then
		m<=m+'1';
		s<="000000";
		if (m="111011") then
		h<=h+'1';
		m<="000000";
		if (h="010111") then
		h<="000000";
end if;
end if;
end if;
end if;
end if;
end if;
end process;
sec <= s;
min <= m;
hr <= h;
end dc_arch;
