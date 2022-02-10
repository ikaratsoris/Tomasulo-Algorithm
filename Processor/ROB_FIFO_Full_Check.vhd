library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROB_FIFO_Full_Check is
    Port ( FIFO_Head : in  STD_LOGIC_VECTOR (2 downto 0);
           FIFO_Tail : in  STD_LOGIC_VECTOR (2 downto 0);
           FIFO_Full : out  STD_LOGIC:= '0');
end ROB_FIFO_Full_Check;

architecture Behavioral of ROB_FIFO_Full_Check is

signal Almost_Full: STD_LOGIC:= '0';

begin
process(FIFO_Head, FIFO_Tail, Almost_Full)
	begin
	if FIFO_Tail + "001" = FIFO_Head then
		Almost_Full <= '1';
	else
		if FIFO_Head /= FIFO_Tail then
			Almost_Full <= '0';
		end if;
	end if;
	
	if FIFO_Head = FIFO_Tail and Almost_Full = '1' then
		FIFO_Full <= '1';
	else
		FIFO_Full <= '0';
	end if;
end process;
end Behavioral;