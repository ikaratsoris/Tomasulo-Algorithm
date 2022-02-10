library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Write_Control is
    Port ( RS_WE : in  STD_LOGIC;
			  Local_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           CDB_V : in  STD_LOGIC_VECTOR (31 downto 0);
           CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
           Issue_Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Issue_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_Vk : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
			  RS_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
			  RS_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
			  WE_Busy : out  STD_LOGIC:= '0';
           WE_Op : out  STD_LOGIC:= '0';
           WE_Vj : out  STD_LOGIC:= '0';
           WE_Qj : out  STD_LOGIC:= '0';
           WE_Vk : out  STD_LOGIC:= '0';
           WE_Qk : out  STD_LOGIC:= '0';
			  Busy : out  STD_LOGIC:= '0';
			  Op : out  STD_LOGIC_VECTOR (3 downto 0):= "0000";
           Vj : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
           Qj : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           Vk : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
           Qk : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end RS_Write_Control;

architecture Behavioral of RS_Write_Control is

begin
process(RS_WE, CDB_V, CDB_Q, Issue_Op, Issue_Tag, RF_Vj, RF_Qj, RF_Vk, RF_Qk, RS_Qj, RS_Qk)
	begin
		if RS_WE = '1' then
			if Local_Tag = Issue_Tag then
				if RF_Qj = CDB_Q and RF_Qk /= CDB_Q and CDB_Q /= "00000" then
					WE_Busy <= '1';
					WE_Op <= '1';
					WE_Vj <= '1';
					WE_Qj <= '1';
					WE_Vk <= '1';
					WE_Qk <= '1';
					Busy <= '1';
					Op <= Issue_Op;
					Vj <= CDB_V;
					Qj <= "00000";
					Vk <= RF_Vk;
					Qk <= RF_Qk;
				elsif RF_Qj /= CDB_Q and RF_Qk = CDB_Q and CDB_Q /= "00000" then
					WE_Busy <= '1';
					WE_Op <= '1';
					WE_Vj <= '1';
					WE_Qj <= '1';
					WE_Vk <= '1';
					WE_Qk <= '1';
					Busy <= '1';
					Op <= Issue_Op;
					Vj <= RF_Vj;
					Qj <= RF_Qj;
					Vk <= CDB_V;
					Qk <= "00000";
				elsif RF_Qj = CDB_Q and RF_Qk = CDB_Q and CDB_Q /= "00000" then
					WE_Busy <= '1';
					WE_Op <= '1';
					WE_Vj <= '1';
					WE_Qj <= '1';
					WE_Vk <= '1';
					WE_Qk <= '1';
					Busy <= '1';
					Op <= Issue_Op;
					Vj <= CDB_V;
					Qj <= "00000";
					Vk <= CDB_V;
					Qk <= "00000";
				else
					WE_Busy <= '1';
					WE_Op <= '1';
					WE_Vj <= '1';
					WE_Qj <= '1';
					WE_Vk <= '1';
					WE_Qk <= '1';
					Busy <= '1';
					Op <= Issue_Op;
					Vj <= RF_Vj;
					Qj <= RF_Qj;
					Vk <= RF_Vk;
					Qk <= RF_Qk;
				end if;
			else
				if Local_Tag = CDB_Q and CDB_Q /= "00000" then
					WE_Busy <= '1';
					WE_Op <= '1';
					WE_Vj <= '1';
					WE_Qj <= '1';
					WE_Vk <= '1';
					WE_Qk <= '1';
					Busy <= '0';
					Op <= "0000";
					Vj <= "00000000000000000000000000000000";
					Qj <= "00000";
					Vk <= "00000000000000000000000000000000";
					Qk <= "00000";
				else
					if RS_Qj = CDB_Q and RS_Qk /= CDB_Q and CDB_Q /= "00000" then
						WE_Busy <= '0';
						WE_Op <= '0';
						WE_Vj <= '1';
						WE_Qj <= '1';
						WE_Vk <= '0';
						WE_Qk <= '0';
						Vj <= CDB_V;
						Qj <= "00000";
					elsif RS_Qj /= CDB_Q and RS_Qk = CDB_Q and CDB_Q /= "00000" then
						WE_Busy <= '0';
						WE_Op <= '0';
						WE_Vj <= '0';
						WE_Qj <= '0';
						WE_Vk <= '1';
						WE_Qk <= '1';
						Vk <= CDB_V;
						Qk <= "00000";
					elsif RS_Qj = CDB_Q and RS_Qk = CDB_Q and CDB_Q /= "00000" then
						WE_Busy <= '0';
						WE_Op <= '0';
						WE_Vj <= '1';
						WE_Qj <= '1';
						WE_Vk <= '1';
						WE_Qk <= '1';
						Vj <= CDB_V;
						Qj <= "00000";
						Vk <= CDB_V;
						Qk <= "00000";
					else
						WE_Busy <= '0';
						WE_Op <= '0';
						WE_Vj <= '0';
						WE_Qj <= '0';
						WE_Vk <= '0';
						WE_Qk <= '0';
					end if;
				end if;
			end if;
		else
			if Local_Tag = CDB_Q and CDB_Q /= "00000" then
				WE_Busy <= '1';
				WE_Op <= '1';
				WE_Vj <= '1';
				WE_Qj <= '1';
				WE_Vk <= '1';
				WE_Qk <= '1';
				Busy <= '0';
				Op <= "0000";
				Vj <= "00000000000000000000000000000000";
				Qj <= "00000";
				Vk <= "00000000000000000000000000000000";
				Qk <= "00000";
			else
				if RS_Qj = CDB_Q and RS_Qk /= CDB_Q and CDB_Q /= "00000" then
					WE_Busy <= '0';
					WE_Op <= '0';
					WE_Vj <= '1';
					WE_Qj <= '1';
					WE_Vk <= '0';
					WE_Qk <= '0';
					Vj <= CDB_V;
					Qj <= "00000";
				elsif RS_Qj /= CDB_Q and RS_Qk = CDB_Q and CDB_Q /= "00000" then
					WE_Busy <= '0';
					WE_Op <= '0';
					WE_Vj <= '0';
					WE_Qj <= '0';
					WE_Vk <= '1';
					WE_Qk <= '1';
					Vk <= CDB_V;
					Qk <= "00000";
				elsif RS_Qj = CDB_Q and RS_Qk = CDB_Q and CDB_Q /= "00000" then
					WE_Busy <= '0';
					WE_Op <= '0';
					WE_Vj <= '1';
					WE_Qj <= '1';
					WE_Vk <= '1';
					WE_Qk <= '1';
					Vj <= CDB_V;
					Qj <= "00000";
					Vk <= CDB_V;
					Qk <= "00000";
				else
					WE_Busy <= '0';
					WE_Op <= '0';
					WE_Vj <= '0';
					WE_Qj <= '0';
					WE_Vk <= '0';
					WE_Qk <= '0';
				end if;
			end if;
		end if;
end process;
end Behavioral;