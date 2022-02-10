library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Issue is
    Port ( ROB_Full : in  STD_LOGIC;
			  Excep_En : in  STD_LOGIC;
			  RS0_Logic_Busy : in  STD_LOGIC;
           RS1_Logic_Busy : in  STD_LOGIC;
           RS0_Arith_Busy : in  STD_LOGIC;
           RS1_Arith_Busy : in  STD_LOGIC;
           RS2_Arith_Busy : in  STD_LOGIC;
			  Instruction : in  STD_LOGIC_VECTOR (19 downto 0);
			  Accepted : out  STD_LOGIC:= '0';
			  WrEn : out  STD_LOGIC:= '0';
			  Op : out  STD_LOGIC_VECTOR (3 downto 0):= "0000";
           Ri : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           Rj : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           Rk : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           RS_Tag : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end Issue;

architecture Behavioral of Issue is

begin
process(ROB_Full, Excep_En, RS0_Logic_Busy, RS1_Logic_Busy, RS0_Arith_Busy, RS1_Arith_Busy, RS2_Arith_Busy, Instruction)
	begin
	if Instruction(19) = '1' and ROB_Full = '0' and Excep_En = '0' then
		if Instruction(18 downto 15) = "0000" or Instruction(18 downto 15) = "0001" or Instruction(18 downto 15) = "0010" then --Logic
			if RS0_Logic_Busy = '0' and RS1_Logic_Busy = '0' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "00001";
			elsif RS0_Logic_Busy = '0' and RS1_Logic_Busy = '1' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "00001";
			elsif RS0_Logic_Busy = '1' and RS1_Logic_Busy = '0' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "00010";
			else
				Accepted <= '0';
				WrEn <= '0';
				Op <= "0000";
				Ri <= "00000";
				Rj <= "00000";
				Rk <= "00000";
				RS_Tag <= "00000";
			end if;
		elsif Instruction(18 downto 15) = "0100" or Instruction(18 downto 15) = "0101" or Instruction(18 downto 15) = "0110" then --Arith
			if RS0_Arith_Busy = '0' and RS1_Arith_Busy = '0' and RS2_Arith_Busy = '0' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "01001";
			elsif RS0_Arith_Busy = '0' and RS1_Arith_Busy = '0' and RS2_Arith_Busy = '1' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "01001";
			elsif RS0_Arith_Busy = '0' and RS1_Arith_Busy = '1' and RS2_Arith_Busy = '0' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "01001";
			elsif RS0_Arith_Busy = '0' and RS1_Arith_Busy = '1' and RS2_Arith_Busy = '1' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "01001";
			elsif RS0_Arith_Busy = '1' and RS1_Arith_Busy = '0' and RS2_Arith_Busy = '0' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "01010";
			elsif RS0_Arith_Busy = '1' and RS1_Arith_Busy = '0' and RS2_Arith_Busy = '1' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "01010";
			elsif RS0_Arith_Busy = '1' and RS1_Arith_Busy = '1' and RS2_Arith_Busy = '0' then
				Accepted <= '1';
				WrEn <= '1';
				Op <= Instruction(18 downto 15);
				Ri <= Instruction(14 downto 10);
				Rj <= Instruction(9 downto 5);
				Rk <= Instruction(4 downto 0);
				RS_Tag <= "01011";
			else
				Accepted <= '0';
				WrEn <= '0';
				Op <= "0000";
				Ri <= "00000";
				Rj <= "00000";
				Rk <= "00000";
				RS_Tag <= "00000";
			end if;
		else
			Accepted <= '0';
			WrEn <= '0';
			Op <= "0000";
			Ri <= "00000";
			Rj <= "00000";
			Rk <= "00000";
			RS_Tag <= "00000";
		end if;
	else
		Accepted <= '0';
		WrEn <= '0';
		Op <= "0000";
		Ri <= "00000";
		Rj <= "00000";
		Rk <= "00000";
		RS_Tag <= "00000";
	end if;
end process;
end Behavioral;