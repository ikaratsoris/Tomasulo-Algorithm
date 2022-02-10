library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Logic_Control is
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  RS0_Ready : in  STD_LOGIC;
			  RS1_Ready : in  STD_LOGIC;
			  CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
			  Mux_Sel : out  STD_LOGIC_VECTOR (1 downto 0):= "11");
end RS_Logic_Control;

architecture Behavioral of RS_Logic_Control is

type State_Type is (State_0, State_1);
signal State : State_Type;

signal RS0_Waits, RS1_Waits: STD_LOGIC:= '0';
signal RS0_Available, RS1_Available: STD_LOGIC:= '1';

begin
process
	begin
		wait until CLK'EVENT and CLK = '1';
		if Reset = '1' then
			State <= State_0;
			Mux_Sel <= "11";
			RS0_Waits <= '0';
			RS1_Waits <= '0';
			RS0_Available <= '1';
			RS1_Available <= '1';
		else
			case state is
				when State_0 =>
					State <= State_1;
					if CDB_Q = "00001" then
						RS0_Available <= '1';
						Mux_Sel <= "11";
					elsif CDB_Q = "00010" then
						RS1_Available <= '1';
						Mux_Sel <= "11";
					end if;
					if RS0_Waits = '1' or RS1_Waits = '1' then --An perimenei kapoio apo ta tria RS
						if RS0_Waits = '1' then --An perimenei to RS0 to epilegoume
							RS0_Waits <= '0';
							Mux_Sel <= "00";
							if RS1_Ready = '1' and RS1_Available = '1' then --Elegxoyme mipos to RS1 eina etoimo
								RS1_Waits <= '1';
								RS1_Available <= '0';
							end if;
						elsif RS1_Waits = '1' then --An perimenei to RS1 to epilegoume
							RS1_Waits <= '0';
							Mux_Sel <= "01";
							if RS0_Ready = '1' and RS0_Available = '1' then --Elegxoyme mipos to RS0 eina etoimo
								RS0_Waits <= '1';
								RS0_Available <= '0';
							end if;
						else
							Mux_Sel <= "11";
						end if;
					else
						if RS0_Ready = '1' and RS0_Available = '1' then
							RS0_Available <= '0';
							Mux_Sel <= "00";
							if RS1_Ready = '1' and RS1_Available = '1' then
								RS1_Waits <= '1';
								RS1_Available <= '0';
							end if;
						elsif RS1_Ready = '1' and RS1_Available = '1' then
							RS1_Available <= '0';
							Mux_Sel <= "01";
						else
							Mux_Sel <= "11";
						end if;
					end if;
				when State_1 =>
					State <= State_0;
					if CDB_Q = "00001" then
						RS0_Available <= '1';
						Mux_Sel <= "11";
					elsif CDB_Q = "00010" then
						RS1_Available <= '1';
						Mux_Sel <= "11";
					end if;
					if RS0_Waits = '1' or RS1_Waits = '1' then --An perimenei kapoio apo ta tria RS
						if RS1_Waits = '1' then --An perimenei to RS1 to epilegoume
							RS1_Waits <= '0';
							Mux_Sel <= "01";
							if RS0_Ready = '1' and RS0_Available = '1' then --Elegxoyme mipos to RS0 eina etoimo
								RS0_Waits <= '1';
								RS0_Available <= '0';
							end if;
						elsif RS0_Waits = '1' then --An perimenei to RS0 to epilegoume
							RS0_Waits <= '0';
							Mux_Sel <= "00";
							if RS1_Ready = '1' and RS1_Available = '1' then --Elegxoyme mipos to RS1 eina etoimo
								RS1_Waits <= '1';
								RS1_Available <= '0';
							end if;
						else
							Mux_Sel <= "11";
						end if;
					else
						if RS1_Ready = '1' and RS1_Available = '1' then
							RS1_Available <= '0';
							Mux_Sel <= "01";
							if RS0_Ready = '1' and RS0_Available = '1' then
								RS0_Waits <= '1';
								RS0_Available <= '0';
							end if;
						elsif RS0_Ready = '1' and RS0_Available = '1' then
							RS0_Available <= '0';
							Mux_Sel <= "00";
						else
							Mux_Sel <= "11";
						end if;
					end if;
			end case;
		end if;
end process;
end Behavioral;