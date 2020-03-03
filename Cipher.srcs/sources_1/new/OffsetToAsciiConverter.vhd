----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2020 09:46:31
-- Design Name: 
-- Module Name: OffsetToAsciiConverter - Behavioral
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

entity OffsetToAsciiConverter is
    Port ( offset : in STD_LOGIC_VECTOR (4 downto 0);
           asciiCode : out STD_LOGIC_VECTOR (7 downto 0));
end OffsetToAsciiConverter;

architecture Behavioral of OffsetToAsciiConverter is

begin
with offset select asciiCode <=
	"01100001" when "00000" ,
	 "01100010" when "00001",
	  "01100011" when "00010",
	  "01100100" when "00011",
	  "01100101" when "00100",
	  "01100110" when "00101",
	  "01100111" when "00110",
	  "01101000" when "00111",
	  "01101001" when "01000",
	  "01101010" when "01001",
	  "01101011" when "01010",
	 "01101100" when "01011" ,
	  "01101101" when "01100",
	 "01101110" when "01101" ,
	 "01101111" when "01110" ,
	  "01110000" when "01111",
	 "01110001" when "10000" ,
	 "01110010" when "10001" , 
	 "01110011" when "10010" ,
	  "01110100" when "10011",
	  "01110101" when "10100",
	  "01110110" when "10101",
	  "01110111" when "10110",
	  "01111000" when "10111", 
	  "01111001" when "11000",
	  "01111010" when "11001",
	"11111111" when others;

end Behavioral;
