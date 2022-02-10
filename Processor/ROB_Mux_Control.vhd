library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Mux_Control is
    Port ( Tail_FIFO : in  STD_LOGIC_VECTOR (2 downto 0);
			  Valid_Bit_0 : in  STD_LOGIC;
			  Valid_Bit_1 : in  STD_LOGIC;
			  Valid_Bit_2 : in  STD_LOGIC;
			  Valid_Bit_3 : in  STD_LOGIC;
			  Valid_Bit_4 : in  STD_LOGIC;
			  Valid_Bit_5 : in  STD_LOGIC;
			  Valid_Bit_6 : in  STD_LOGIC;
			  Valid_Bit_7 : in  STD_LOGIC;
			  Mux_Sel_Reg_ROB : out  STD_LOGIC_VECTOR (2 downto 0):= "000";
			  MUX_Sel_ROB_MEM : out  STD_LOGIC:= '0');
end ROB_Mux_Control;

architecture Behavioral of ROB_Mux_Control is

begin
process(Tail_FIFO, Valid_Bit_0, Valid_Bit_1, Valid_Bit_2, Valid_Bit_3, Valid_Bit_4, Valid_Bit_5, Valid_Bit_6, Valid_Bit_7)
	begin
	case Tail_FIFO is
		when "000" => --Stoixeio sthn thesi 7
			if Valid_Bit_6 = '1' then
				Mux_Sel_Reg_ROB <= "110";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_5 = '1' then
				Mux_Sel_Reg_ROB <= "101";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_4 = '1' then
				Mux_Sel_Reg_ROB <= "100";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_3 = '1' then
				Mux_Sel_Reg_ROB <= "011";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_2 = '1' then
				Mux_Sel_Reg_ROB <= "010";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_1 = '1' then
				Mux_Sel_Reg_ROB <= "001";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_0 = '1' then
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when "001" => --Stoixeio sthn thesi 0
			if Valid_Bit_7 = '1' then
				Mux_Sel_Reg_ROB <= "111";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_6 = '1' then
				Mux_Sel_Reg_ROB <= "110";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_5 = '1' then
				Mux_Sel_Reg_ROB <= "101";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_4 = '1' then
				Mux_Sel_Reg_ROB <= "100";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_3 = '1' then
				Mux_Sel_Reg_ROB <= "011";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_2 = '1' then
				Mux_Sel_Reg_ROB <= "010";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_1 = '1' then
				Mux_Sel_Reg_ROB <= "001";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when "010" => --Stoixeio sthn thesi 1
			if Valid_Bit_0 = '1' then
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_7 = '1' then
				Mux_Sel_Reg_ROB <= "111";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_6 = '1' then
				Mux_Sel_Reg_ROB <= "110";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_5 = '1' then
				Mux_Sel_Reg_ROB <= "101";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_4 = '1' then
				Mux_Sel_Reg_ROB <= "100";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_3 = '1' then
				Mux_Sel_Reg_ROB <= "011";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_2 = '1' then
				Mux_Sel_Reg_ROB <= "010";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when "011" => --Stoixeio sthn thesi 2
			if Valid_Bit_1 = '1' then
				Mux_Sel_Reg_ROB <= "001";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_0 = '1' then
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_7 = '1' then
				Mux_Sel_Reg_ROB <= "111";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_6 = '1' then
				Mux_Sel_Reg_ROB <= "110";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_5 = '1' then
				Mux_Sel_Reg_ROB <= "101";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_4 = '1' then
				Mux_Sel_Reg_ROB <= "100";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_3 = '1' then
				Mux_Sel_Reg_ROB <= "011";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when "100" => --Stoixeio sthn thesi 3
			if Valid_Bit_2 = '1' then
				Mux_Sel_Reg_ROB <= "010";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_1 = '1' then
				Mux_Sel_Reg_ROB <= "001";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_0 = '1' then
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_7 = '1' then
				Mux_Sel_Reg_ROB <= "111";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_6 = '1' then
				Mux_Sel_Reg_ROB <= "110";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_5 = '1' then
				Mux_Sel_Reg_ROB <= "101";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_4 = '1' then
				Mux_Sel_Reg_ROB <= "100";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when "101" => --Stoixeio sthn thesi 4
			if Valid_Bit_3 = '1' then
				Mux_Sel_Reg_ROB <= "011";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_2 = '1' then
				Mux_Sel_Reg_ROB <= "010";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_1 = '1' then
				Mux_Sel_Reg_ROB <= "001";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_0 = '1' then
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_7 = '1' then
				Mux_Sel_Reg_ROB <= "111";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_6 = '1' then
				Mux_Sel_Reg_ROB <= "110";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_5 = '1' then
				Mux_Sel_Reg_ROB <= "101";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when "110" => --Stoixeio sthn thesi 5
			if Valid_Bit_4 = '1' then
				Mux_Sel_Reg_ROB <= "100";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_3 = '1' then
				Mux_Sel_Reg_ROB <= "011";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_2 = '1' then
				Mux_Sel_Reg_ROB <= "010";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_1 = '1' then
				Mux_Sel_Reg_ROB <= "001";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_0 = '1' then
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_7 = '1' then
				Mux_Sel_Reg_ROB <= "111";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_6 = '1' then
				Mux_Sel_Reg_ROB <= "110";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when "111" => --Stoixeio sthn thesi 6
			if Valid_Bit_5 = '1' then
				Mux_Sel_Reg_ROB <= "101";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_4 = '1' then
				Mux_Sel_Reg_ROB <= "100";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_3 = '1' then
				Mux_Sel_Reg_ROB <= "011";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_2 = '1' then
				Mux_Sel_Reg_ROB <= "010";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_1 = '1' then
				Mux_Sel_Reg_ROB <= "001";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_0 = '1' then
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '1';
			elsif Valid_Bit_7 = '1' then
				Mux_Sel_Reg_ROB <= "111";
				MUX_Sel_ROB_MEM <= '1';
			else
				Mux_Sel_Reg_ROB <= "000";
				MUX_Sel_ROB_MEM <= '0';
			end if;
		when others =>
			null;
	end case;
end process;
end Behavioral;