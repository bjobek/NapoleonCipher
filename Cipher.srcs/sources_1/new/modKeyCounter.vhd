----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2020 12:23:28
-- Design Name: 
-- Module Name: modKeyCounter - Behavioral
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

entity modKeyCounter is
    Port ( en : in STD_LOGIC;
           clr,clk : in STD_LOGIC;
           cntOut : out STD_LOGIC_VECTOR (4 downto 0));
end modKeyCounter;

architecture Behavioral of modKeyCounter is
constant KEYSIZE : unsigned(4 downto 0) := "10001";
signal n : unsigned(4 downto 0);
begin
---- n to romK count
process(clk)
begin
if (clr='1') then
--n<= (others =>'0');
n<="00001";
elsif(rising_edge(clk)) then
n<=n;
if(en = '1') then

n<=n+1;

if(n=KEYSIZE) then -- if key size, wrap around
--n<= (others =>'0');
n<="00001";
end if;
end if;
end if;

end process;
cntOut<=std_logic_vector(n);
end Behavioral;
