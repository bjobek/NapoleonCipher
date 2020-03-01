----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2020 13:14:29
-- Design Name: 
-- Module Name: romA - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity romA is
  Port (
  asciiCode : in std_logic_vector(7 downto 0);
  offset : out std_logic_vector(4 downto 0)
   );
end romA;


architecture Behavioral of romA is

begin

with asciiCode select offset <=
	"00000" when "01100001",
	"00001" when "01100010",
	"00010" when "01100011",
	"00011" when "01100100",
	"00100" when "01100101",
	"00101" when "01100110",
	"00110" when "01100111",
	"00111" when "01101000",
	"01000" when "01101001",
	"01001" when "01101010",
	"01010" when "01101011",
	"01011" when "01101100",
	"01100" when "01101101",
	"01101" when "01101110",
	"01110" when "01101111",
	"01111" when "01110000",
	"10000" when "01110001",
	"10001" when "01110010",
	"10010" when "01110011",
	"10011" when "01110100",
	"10100" when "01110101",
	"10101" when "01110110",
	"10110" when "01110111",
	"10111" when "01111000",
	"11000" when "01111001",
	"11001" when "01111010",
	"11111" when others;

end Behavioral;
