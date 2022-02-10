library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CDB_Control is
    Port ( Clk : in  STD_LOGIC;
			  Rst : in  STD_LOGIC;
           Req_Arith : in  STD_LOGIC;
           Req_Logic : in  STD_LOGIC;
           Req_LS : in  STD_LOGIC;
           Grant_Arith : out  STD_LOGIC:= '0';
           Grant_Logic : out  STD_LOGIC:= '0';
           Grant_LS : out  STD_LOGIC:= '0';
			  Mux_Sel : out  STD_LOGIC_VECTOR (1 downto 0):= "11");
end CDB_Control;

architecture Behavioral of CDB_Control is

type State_Type is (Reset, Choice, Broadcast);
signal State : State_Type;

signal Sel: std_logic_vector(1 downto 0):= "11";

begin
process
	begin
		wait until CLK'EVENT and CLK = '1';
		if Rst = '1' then
			State <= Reset;
		else
			case state is
				when Reset =>
					State <= Choice;
					Sel <= "11";
					Mux_Sel <= "11";
					Grant_Arith <= '0';
					Grant_Logic <= '0';
					Grant_LS <= '0';
				when Choice =>
					if Req_Arith = '0' and Req_Logic = '0' and Req_LS = '0' then
						State <= Choice;
						Sel <= "11";
						Mux_Sel <= "11";
						Grant_Arith <= '0';
						Grant_Logic <= '0';
						Grant_LS <= '0';
					elsif Req_Arith = '1' and Req_Logic = '0' and Req_LS = '0' then
						State <= Broadcast;
						Sel <= "00";
						Mux_Sel <= "00";
						Grant_Arith <= '1';
						Grant_Logic <= '0';
						Grant_LS <= '0';
					elsif Req_Arith = '0' and Req_Logic = '1' and Req_LS = '0' then
						State <= Broadcast;
						Sel <= "01";
						Mux_Sel <= "01";
						Grant_Arith <= '0';
						Grant_Logic <= '1';
						Grant_LS <= '0';
					elsif Req_Arith = '1' and Req_Logic = '1' and Req_LS = '0' then
						State <= Broadcast;
						if Sel = "00" then
							Sel <= "01";
							Mux_Sel <= "01";
							Grant_Arith <= '0';
							Grant_Logic <= '1';
							Grant_LS <= '0';
						elsif Sel = "01" then
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						elsif Sel = "10" then
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						else
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						end if;
					elsif Req_Arith = '0' and Req_Logic = '0' and Req_LS = '1' then
						State <= Broadcast;
						Sel <= "10";
						Mux_Sel <= "10";
						Grant_Arith <= '0';
						Grant_Logic <= '0';
						Grant_LS <= '1';
					elsif Req_Arith = '1' and Req_Logic = '0' and Req_LS = '1' then
						State <= Broadcast;
						if Sel = "00" then
							Sel <= "10";
							Mux_Sel <= "10";
							Grant_Arith <= '0';
							Grant_Logic <= '0';
							Grant_LS <= '1';
						elsif Sel = "01" then
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						elsif Sel = "10" then
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						else
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						end if;
					elsif Req_Arith = '0' and Req_Logic = '1' and Req_LS = '1' then
						State <= Broadcast;
						if Sel = "00" then
							Sel <= "01";
							Mux_Sel <= "01";
							Grant_Arith <= '0';
							Grant_Logic <= '1';
							Grant_LS <= '0';
						elsif Sel = "01" then
							Sel <= "10";
							Mux_Sel <= "10";
							Grant_Arith <= '0';
							Grant_Logic <= '0';
							Grant_LS <= '1';
						elsif Sel = "10" then
							Sel <= "01";
							Mux_Sel <= "01";
							Grant_Arith <= '0';
							Grant_Logic <= '1';
							Grant_LS <= '0';
						else
							Sel <= "01";
							Mux_Sel <= "01";
							Grant_Arith <= '0';
							Grant_Logic <= '1';
							Grant_LS <= '0';
						end if;
					elsif Req_Arith = '1' and Req_Logic = '1' and Req_LS = '1' then
						State <= Broadcast;
						if Sel = "00" then
							Sel <= "01";
							Mux_Sel <= "01";
							Grant_Arith <= '0';
							Grant_Logic <= '1';
							Grant_LS <= '0';
						elsif Sel = "01" then
							Sel <= "10";
							Mux_Sel <= "10";
							Grant_Arith <= '0';
							Grant_Logic <= '0';
							Grant_LS <= '1';
						elsif Sel = "10" then
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						else
							Sel <= "00";
							Mux_Sel <= "00";
							Grant_Arith <= '1';
							Grant_Logic <= '0';
							Grant_LS <= '0';
						end if;
					else
						State <= Choice;
						Sel <= "11";
						Mux_Sel <= "11";
						Grant_Arith <= '0';
						Grant_Logic <= '0';
						Grant_LS <= '0';
					end if;
				when Broadcast =>
					State <= Choice;
					Mux_Sel <= "11";
					Grant_Arith <= '0';
					Grant_Logic <= '0';
					Grant_LS <= '0';
			end case;
		end if;
end process;
end Behavioral;