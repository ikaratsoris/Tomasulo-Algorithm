library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Insert_Control is
    Port ( Reset : in  STD_LOGIC;
           Issue_WrEn : in  STD_LOGIC;
			  Issue_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  Insert_0 : out  STD_LOGIC:= '0';
			  Insert_1 : out  STD_LOGIC:= '0';
			  Insert_2 : out  STD_LOGIC:= '0';
			  Insert_3 : out  STD_LOGIC:= '0';
			  Insert_4 : out  STD_LOGIC:= '0';
			  Insert_5 : out  STD_LOGIC:= '0';
			  Insert_6 : out  STD_LOGIC:= '0';
			  Insert_7 : out  STD_LOGIC:= '0';
           Tail_FIFO_Out : out  STD_LOGIC_VECTOR (2 downto 0):= "000");
end ROB_Insert_Control;

architecture Behavioral of ROB_Insert_Control is

signal Tail_FIFO: STD_LOGIC_VECTOR (2 downto 0):= "000";

begin
process(Reset, Issue_Tag)
	begin
	if Reset = '1' then
		Tail_FIFO <= "000";
	else
		if Issue_WrEn = '1' then
			case Tail_FIFO is
				when "000" =>
					Tail_FIFO <= "001";--Dieuthinsi epomenis egrafis
					Insert_0 <= '1';
					Insert_1 <= '0';
					Insert_2 <= '0';
					Insert_3 <= '0';
					Insert_4 <= '0';
					Insert_5 <= '0';
					Insert_6 <= '0';
					Insert_7 <= '0';
				when "001" =>
					Tail_FIFO <= "010";--Dieuthinsi epomenis egrafis
					Insert_0 <= '0';
					Insert_1 <= '1';
					Insert_2 <= '0';
					Insert_3 <= '0';
					Insert_4 <= '0';
					Insert_5 <= '0';
					Insert_6 <= '0';
					Insert_7 <= '0';
				when "010" =>
					Tail_FIFO <= "011";--Dieuthinsi epomenis egrafis
					Insert_0 <= '0';
					Insert_1 <= '0';
					Insert_2 <= '1';
					Insert_3 <= '0';
					Insert_4 <= '0';
					Insert_5 <= '0';
					Insert_6 <= '0';
					Insert_7 <= '0';
				when "011" =>
					Tail_FIFO <= "100";--Dieuthinsi epomenis egrafis
					Insert_0 <= '0';
					Insert_1 <= '0';
					Insert_2 <= '0';
					Insert_3 <= '1';
					Insert_4 <= '0';
					Insert_5 <= '0';
					Insert_6 <= '0';
					Insert_7 <= '0';
				when "100" =>
					Tail_FIFO <= "101";--Dieuthinsi epomenis egrafis
					Insert_0 <= '0';
					Insert_1 <= '0';
					Insert_2 <= '0';
					Insert_3 <= '0';
					Insert_4 <= '1';
					Insert_5 <= '0';
					Insert_6 <= '0';
					Insert_7 <= '0';
				when "101" =>
					Tail_FIFO <= "110";--Dieuthinsi epomenis egrafis
					Insert_0 <= '0';
					Insert_1 <= '0';
					Insert_2 <= '0';
					Insert_3 <= '0';
					Insert_4 <= '0';
					Insert_5 <= '1';
					Insert_6 <= '0';
					Insert_7 <= '0';
				when "110" =>
					Tail_FIFO <= "111";--Dieuthinsi epomenis egrafis
					Insert_0 <= '0';
					Insert_1 <= '0';
					Insert_2 <= '0';
					Insert_3 <= '0';
					Insert_4 <= '0';
					Insert_5 <= '0';
					Insert_6 <= '1';
					Insert_7 <= '0';
				when "111" =>
					Tail_FIFO <= "000";--Dieuthinsi epomenis egrafis
					Insert_0 <= '0';
					Insert_1 <= '0';
					Insert_2 <= '0';
					Insert_3 <= '0';
					Insert_4 <= '0';
					Insert_5 <= '0';
					Insert_6 <= '0';
					Insert_7 <= '1';
				when others =>
					null;
			end case;
		else
			Insert_0 <= '0';
			Insert_1 <= '0';
			Insert_2 <= '0';
			Insert_3 <= '0';
			Insert_4 <= '0';
			Insert_5 <= '0';
			Insert_6 <= '0';
			Insert_7 <= '0';
		end if;
	end if;
end process;
	Tail_FIFO_Out <= Tail_FIFO;
end Behavioral;