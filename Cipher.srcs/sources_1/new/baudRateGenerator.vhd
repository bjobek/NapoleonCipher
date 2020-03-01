----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2020 14:13:22
-- Design Name: 
-- Module Name: baudRateGenerator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity baudRateGenerator is
generic(N: integer := 9);
  Port (
  clk,reset: in std_logic;
  max_tick: out std_logic;
  q: out std_logic_vector(N-1 downto 0)
   );
end baudRateGenerator;

architecture Behavioral of baudRateGenerator is
signal r_reg : unsigned(N-1 downto 0);
signal r_next : unsigned(N-1 downto 0);


begin
-- register part
process(clk,reset)
begin
    if (reset='1') then
        r_reg<= (others=>'0');
    elsif(r_reg="101000110") then
        r_reg<= (others=>'0');
    elsif (clk'event and clk='1') then
        r_reg <= r_next;
        
    end if;
end process;
-- next state logic
r_next <= r_reg+1;
-- output logic
q <= std_logic_vector(r_reg);
max_tick <='1' when r_reg=("101000110") else '0';

end Behavioral;
