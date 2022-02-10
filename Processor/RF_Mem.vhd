library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RF_Mem is
	 Port ( Clk : in STD_LOGIC;
			  WrEn : in STD_LOGIC;
			  Wr_Addr : in STD_LOGIC_VECTOR(4 downto 0);
			  Rd0_Addr : in STD_LOGIC_VECTOR(4 downto 0);
			  Rd1_Addr : in STD_LOGIC_VECTOR(4 downto 0);
			  Wr_Data : in STD_LOGIC_VECTOR(31 downto 0);
			  Rd0_Data : out STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
			  Rd1_Data : out STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000");
end RF_Mem;

architecture Behavioral of RF_Mem is

type ram_type is array (31 downto 0) of STD_LOGIC_VECTOR (31 downto 0);

impure function InitRam return ram_type is
variable ram : ram_type;
begin
	for i in 0 to 31 loop
		ram(i) := x"00000000";
	end loop;
	ram(1) := "00000000000000000000000000000111";--San Li R1,7 gia to testbench
	ram(3) := "00000000000000000000000000001000";--San Li R3,8 gia to testbench
return ram;
end function;

signal RAM: ram_type := InitRam;

begin
process(Clk)
	begin
		if WrEn = '1' then
			RAM(conv_integer(Wr_Addr)) <= Wr_Data;
		end if;
		Rd0_Data <= RAM(conv_integer(Rd0_Addr));
		Rd1_Data <= RAM(conv_integer(Rd1_Addr));
end process;
end Behavioral;