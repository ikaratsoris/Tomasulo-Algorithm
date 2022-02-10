library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_Req_Control is
    Port ( Resp : in  STD_LOGIC:= '0';
			  Prelast_Q : in  STD_LOGIC_VECTOR (4 downto 0);
			  Last_Q : in  STD_LOGIC_VECTOR (4 downto 0);
           Req : out  STD_LOGIC:= '0');
end FU_Req_Control;

architecture Behavioral of FU_Req_Control is

begin
process(Resp, Prelast_Q, Last_Q)
	begin
		if Resp = '1' then
			Req <= '0';
		else
			if Prelast_Q = "00000" and Last_Q = "00000" then
				Req <= '0';
			else
				Req <= '1';
			end if;
		end if;
end process;
end Behavioral;