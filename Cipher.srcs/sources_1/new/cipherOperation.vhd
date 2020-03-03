----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2020 12:03:28
-- Design Name: 
-- Module Name: cipherOperation - Behavioral
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
--use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cipherOperation is
    Port ( keyChar : in STD_LOGIC_VECTOR (4 downto 0);
           msgChar : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in std_logic;
           en : in std_logic;
           transChar : out STD_LOGIC_VECTOR (4 downto 0));
end cipherOperation;

architecture Behavioral of cipherOperation is
signal tmp,keyCharr,msgCharr: std_logic_vector(4 downto 0);
begin
process(clk,keyChar,msgChar)

begin
keyCharr<=keyChar;
msgCharr<=msgChar;
if(rising_edge(clk)) then
if (en='1') then
tmp <= std_logic_vector(to_unsigned(((to_integer(unsigned(keyCharr)) + (25 - to_integer(unsigned(msgCharr)))) mod 26),5));
else
 tmp <= tmp;
end if;
end if;
end process;
transChar <= tmp;
end Behavioral;
