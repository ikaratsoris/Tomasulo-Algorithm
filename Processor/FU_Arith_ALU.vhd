library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FU_Arith_ALU is
    Port ( RS_Arith_Ready : in  STD_LOGIC;
           RS_Arith_Data : in  STD_LOGIC_VECTOR (72 downto 0);
			  ALU_Zero : out  STD_LOGIC:= '0';
           ALU_Cout : out  STD_LOGIC:= '0';
           ALU_Ovf : out  STD_LOGIC:= '0';
           ALU_V_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
           ALU_Q_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end FU_Arith_ALU;

architecture Behavioral of FU_Arith_ALU is

signal tempOutput: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
signal tempA, tempB, tempOut: STD_LOGIC_VECTOR(32 downto 0):= "000000000000000000000000000000000";

begin
process(RS_Arith_Ready, RS_Arith_Data, tempA, tempB, tempOut, tempOutput)
	begin
		if RS_Arith_Ready = '1' then
			case RS_Arith_Data(67 downto 64) is
				when "0100" => --Add: A + B
					tempA(31 downto 0) <= RS_Arith_Data(63 downto 32);
					tempB(31 downto 0) <= RS_Arith_Data(31 downto 0);
					tempA(32) <= '0';
					tempB(32) <= '0';
					tempOut <= tempA + tempB;
					ALU_V_Out <= tempOut(31 downto 0);
					ALU_Q_Out <= RS_Arith_Data(72 downto 68);
					ALU_Cout <= tempOut(32);
					if ((tempA(31) XOR tempB(31)) = '0') and (((tempA(31) = '0') and (tempOut(31) = '1')) or ((tempA(31) = '1') and (tempOut(31) = '0'))) then
						ALU_Ovf <= '1';
					else
						ALU_Ovf <= '0';
					end if;
					if tempOut = "00000000000000000000000000000000" then
						ALU_Zero <= '1';
					else
						ALU_Zero <= '0';
					end if;
				when "0101" => --Sub: A - B
					tempA(31 downto 0) <= RS_Arith_Data(63 downto 32);
					tempB(31 downto 0) <= RS_Arith_Data(31 downto 0);
					tempA(32) <= '0';
					tempB(32) <= '0';
					tempOut <= tempA - tempB;
					ALU_V_Out <= tempOut(31 downto 0);
					ALU_Q_Out <= RS_Arith_Data(72 downto 68);
					ALU_Cout <= tempOut(32);
					if ((tempA(31) XOR tempB(31)) = '1') and (((tempA(31) = '0') and (tempOut(31) = '1')) or ((tempA(31) = '1') and (tempOut(31) = '0'))) then
						ALU_Ovf <= '1';
					else
						ALU_Ovf <= '0';
					end if;
					if tempOut = "00000000000000000000000000000000" then
						ALU_Zero <= '1';
					else
						ALU_Zero <= '0';
					end if;
				when "0110" => --Arithmetic Left Shift
					tempOutput(31 downto 1) <= RS_Arith_Data(62 downto 32);
					tempOutput(0) <= RS_Arith_Data(63);
					ALU_V_Out <= tempOutput;
					ALU_Q_Out <= RS_Arith_Data(72 downto 68);
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