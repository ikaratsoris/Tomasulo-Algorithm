library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FU_Logic_ALU is
    Port ( RS_Logic_Ready : in  STD_LOGIC;
           RS_Logic_Data : in  STD_LOGIC_VECTOR (72 downto 0);
			  ALU_Zero : out  STD_LOGIC:= '0';
           ALU_Cout : out  STD_LOGIC:= '0';
           ALU_Ovf : out  STD_LOGIC:= '0';
           ALU_V_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
           ALU_Q_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end FU_Logic_ALU;

architecture Behavioral of FU_Logic_ALU is

signal tempOutput: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

begin
process(RS_Logic_Ready, RS_Logic_Data, tempOutput)
	begin
		if RS_Logic_Ready = '1' then
			case RS_Logic_Data(67 downto 64) is
				when "0000" => --Or: A||B
					tempOutput <= RS_Logic_Data(63 downto 32) or RS_Logic_Data(31 downto 0);
					ALU_V_Out <= tempOutput;
					ALU_Q_Out <= RS_Logic_Data(72 downto 68);
					ALU_Cout <= '0';
					ALU_Ovf <= '0';
					if tempOutput = "00000000000000000000000000000000" then
						ALU_Zero <= '1';
					else
						ALU_Zero <= '0';
					end if;
				when "0001" => --And: A && B
					tempOutput <= RS_Logic_Data(63 downto 32) and RS_Logic_Data(31 downto 0);
					ALU_V_Out <= tempOutput;
					ALU_Q_Out <= RS_Logic_Data(72 downto 68);
					ALU_Cout <= '0';
					ALU_Ovf <= '0';
					if tempOutput = "00000000000000000000000000000000" then
						ALU_Zero <= '1';
					else
						ALU_Zero <= '0';
					end if;
				when "0010" => --Not: !A
					tempOutput <= not RS_Logic_Data(63 downto 32);
					ALU_V_Out <= tempOutput;
					ALU_Q_Out <= RS_Logic_Data(72 downto 68);
					ALU_Cout <= '0';
					ALU_Ovf <= '0';
					if tempOutput = "00000000000000000000000000000000" then
						ALU_Zero <= '1';
					else
						ALU_Zero <= '0';
					end if;
				when others =>
					ALU_V_Out <= "00000000000000000000000000000000";
					ALU_Q_Out <= "00000";
					ALU_Cout <= '0';
					ALU_Ovf <= '0';
					ALU_Zero <= '0';
			end case;
		else
			ALU_V_Out <= "00000000000000000000000000000000";
			ALU_Q_Out <= "00000";
			ALU_Cout <= '0';
			ALU_Ovf <= '0';
			ALU_Zero <= '0';
		end if;
end process;
end Behavioral;