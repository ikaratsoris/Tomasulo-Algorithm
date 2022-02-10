library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_1 is
    Port ( CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           Data : in  STD_LOGIC;
           Dout : out  STD_LOGIC:= '0');
end Reg_1;

architecture Behavioral of Reg_1 is

begin
process
	begin
		wait until CLK'EVENT and CLK = '1';
		if WE = '1' and RST = '0' then
			Dout <= Data;
		elsif WE = '0' and RST = '1' then
			Dout <= '0';
		end if;
	end process;
end Behavioral;