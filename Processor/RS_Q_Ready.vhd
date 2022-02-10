library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Q_Ready is
    Port ( Reset : in  STD_LOGIC;
			  Local_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  WrEn_Busy : in  STD_LOGIC;
           WrEn_Qj : in  STD_LOGIC;
           WrEn_Qk : in  STD_LOGIC;
			  Input_Busy : in  STD_LOGIC;
			  Input_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Input_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           RS_Ready : out  STD_LOGIC);
end RS_Q_Ready;

architecture Behavioral of RS_Q_Ready is

signal Qj_Ready, Qk_Ready: STD_LOGIC:= '0';

begin
process(Reset, WrEn_Qj, WrEn_Qk, Input_Qj, Input_Qk, Qj_Ready, Qk_Ready)
	begin
	if Reset = '1' then
		RS_Ready <= '0';
		Qj_Ready <= '0';
		Qk_Ready <= '0';
	else
		if Input_Busy = '0' and WrEn_Busy = '1' then
			RS_Ready <= '0';
			Qj_Ready <= '0';
			Qk_Ready <= '0';
		else
			if WrEn_Qj = '1' and WrEn_Qk = '1' then
				if Input_Qj = "00000" and Input_Qk = "00000" then
					RS_Ready <= '1';
				elsif Input_Qj = "00000" and Input_Qk /= "00000" then
					Qj_Ready <= '1';
					if Qk_Ready = '1' then
						RS_Ready <= '1';
					else
						RS_Ready <= '0';
					end if;
				elsif Input_Qj /= "00000" and Input_Qk = "00000" then
					Qk_Ready <= '1';
					if Qj_Ready = '1' then
						RS_Ready <= '1';
					else
						RS_Ready <= '0';
					end if;
				else
					RS_Ready <= '0';
				end if;
			elsif WrEn_Qj = '1' and WrEn_Qk = '0' then
				if Input_Qj = "00000" then
					Qj_Ready <= '1';
					if Qk_Ready = '1' then
						RS_Ready <= '1';
					else
						RS_Ready <= '0';
					end if;
				end if;
			elsif WrEn_Qj = '0' and WrEn_Qk = '1' then
				if Input_Qk = "00000" then
					Qk_Ready <= '1';
					if Qj_Ready = '1' then
						RS_Ready <= '1';
					else
						RS_Ready <= '0';
					end if;
				end if;
			else
				if Qj_Ready = '1' and  Qk_Ready = '1' then
					RS_Ready <= '1';
				else
					RS_Ready <= '0';
				end if;
			end if;
		end if;
	end if;
end process;
end Behavioral;