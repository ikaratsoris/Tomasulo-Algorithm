library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Remove_Control is
    Port ( Reset : in  STD_LOGIC;
			  Done_0 : in  STD_LOGIC;
	 		  Done_1 : in  STD_LOGIC;
			  Done_2 : in  STD_LOGIC;
			  Done_3 : in  STD_LOGIC;
			  Done_4 : in  STD_LOGIC;
			  Done_5 : in  STD_LOGIC;
			  Done_6 : in  STD_LOGIC;
			  Done_7 : in  STD_LOGIC;
			  Remove_0 : out  STD_LOGIC:= '0';
			  Remove_1 : out  STD_LOGIC:= '0';
			  Remove_2 : out  STD_LOGIC:= '0';
			  Remove_3 : out  STD_LOGIC:= '0';
			  Remove_4 : out  STD_LOGIC:= '0';
			  Remove_5 : out  STD_LOGIC:= '0';
			  Remove_6 : out  STD_LOGIC:= '0';
			  Remove_7 : out  STD_LOGIC:= '0';
           Head_FIFO_Out : out  STD_LOGIC_VECTOR (2 downto 0):= "000");
end ROB_Remove_Control;

architecture Behavioral of ROB_Remove_Control is

signal Rmv_0, Rmv_1, Rmv_2, Rmv_3, Rmv_4, Rmv_5, Rmv_6, Rmv_7: STD_LOGIC:= '0';
signal Head_FIFO: STD_LOGIC_VECTOR (2 downto 0):= "000";

begin
process(Reset, Done_0, Done_1, Done_2, Done_3, Done_4, Done_5, Done_6, Done_7, Head_FIFO)
	begin
	if Reset = '1' then
		Head_FIFO <= "000";
		Rmv_0 <= '0';
		Rmv_1 <= '0';
		Rmv_2 <= '0';
		Rmv_3 <= '0';
		Rmv_4 <= '0';
		Rmv_5 <= '0';
		Rmv_6 <= '0';
		Rmv_7 <= '0';
	else
		case Head_FIFO is
			when "000" =>
				if Done_0 = '1' and Rmv_0 = '0' then
					Rmv_0 <= '1';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_0 = '0' and Rmv_0 = '1' then
					Head_FIFO <= "001";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_0 = '0' and Rmv_0 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when "001" =>
				if Done_1 = '1' and Rmv_1 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '1';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_1 = '0' and Rmv_1 = '1' then
					Head_FIFO <= "010";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_1 = '0' and Rmv_1 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when "010" =>
				if Done_2 = '1' and Rmv_2 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '1';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_2 = '0' and Rmv_2 = '1' then
					Head_FIFO <= "011";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_2 = '0' and Rmv_2 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when "011" =>
				if Done_3 = '1' and Rmv_3 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '1';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_3 = '0' and Rmv_3 = '1' then
					Head_FIFO <= "100";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_3 = '0' and Rmv_3 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when "100" =>
				if Done_4 = '1' and Rmv_4 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '1';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_4 = '0' and Rmv_4 = '1' then
					Head_FIFO <= "101";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_4 = '0' and Rmv_4 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when "101" =>
				if Done_5 = '1' and Rmv_5 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '1';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_5 = '0' and Rmv_5 = '1' then
					Head_FIFO <= "110";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_5 = '0' and Rmv_5 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when "110" =>
				if Done_6 = '1' and Rmv_6 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '1';
					Rmv_7 <= '0';
				elsif Done_6 = '0' and Rmv_6 = '1' then
					Head_FIFO <= "111";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_6 = '0' and Rmv_6 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when "111" =>
				if Done_7 = '1' and Rmv_7 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '1';
				elsif Done_7 = '0' and Rmv_7 = '1' then
					Head_FIFO <= "000";
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				elsif Done_7 = '0' and Rmv_7 = '0' then
					Rmv_0 <= '0';
					Rmv_1 <= '0';
					Rmv_2 <= '0';
					Rmv_3 <= '0';
					Rmv_4 <= '0';
					Rmv_5 <= '0';
					Rmv_6 <= '0';
					Rmv_7 <= '0';
				else
					null;
				end if;
			when others =>
				null;
		end case;
	end if;
end process;
	Head_FIFO_Out <= Head_FIFO;
	Remove_0 <= Rmv_0;
	Remove_1 <= Rmv_1;
	Remove_2 <= Rmv_2;
	Remove_3 <= Rmv_3;
	Remove_4 <= Rmv_4;
	Remove_5 <= Rmv_5;
	Remove_6 <= Rmv_6;
	Remove_7 <= Rmv_7;
end Behavioral;