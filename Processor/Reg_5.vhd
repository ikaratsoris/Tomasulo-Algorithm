library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_5 is
    Port ( CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end Reg_5;

architecture Behavioral of Reg_5 is

begin
process
	begin
		wait until CLK'EVENT and CLK = '1';
		if WE = '1' and RST = '0' then
			Dout <= Data;
		elsif WE = '0' and RST = '1' then
			Dout <= "00000";
		end if;
	end process;
end Behavioral;