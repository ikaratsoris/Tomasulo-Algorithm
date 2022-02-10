library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_Delay_Reg is
    Port ( Clk : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Q_In : in  STD_LOGIC_VECTOR (4 downto 0);
           V_In : in  STD_LOGIC_VECTOR (31 downto 0);
           Q_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           V_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end FU_Delay_Reg;

architecture Behavioral of FU_Delay_Reg is

begin
process
	begin
		wait until CLK'EVENT and CLK = '1';
		if WE = '1' and RST = '0' then
			Q_Out <= Q_In;
			V_Out <= V_In;
		elsif WE = '0' and RST = '1' then
			Q_Out <= "00000";
			V_Out <= "00000000000000000000000000000000";
		end if;
	end process;
end Behavioral;