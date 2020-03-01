----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2020 13:14:29
-- Design Name: 
-- Module Name: romK - Behavioral
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

entity romK is
  Port (
  keyIndex : in std_logic_vector(4 downto 0);
  keyOffsetOut : out std_logic_vector(4 downto 0)
   );
end romK;

architecture Behavioral of romK is
--- KEY: APPLE
begin
--with keyIndex select keyOffsetOut <=
--"00000" when "00001",-- A
--"01111" when "00010",-- P
--"01111" when "00011",-- P
--"01011" when "00100",-- L
--"00100" when "00101",-- E
--"00000" when others; -- first letter in key when undefined value input


with keyIndex select keyOffsetOut <=
"01001" when "00001",-- J
"00100" when "00010",-- E
"00000" when "00011",-- A
"01101" when "00100",-- N
"01001" when "00101",-- J
"00000" when "00110",-- A
"00010" when "00111",-- C
"10000" when "01000",-- Q
"10100" when "01001",-- U
"00100" when "01010",-- E
"10010" when "01011",-- S
"10001" when "01100",-- R
"01110" when "01101",-- O
"10100" when "01110",-- U
"10010" when "01111",-- S
"10010" when "10000",-- S
"00100" when "10001",-- E
"00000" when others; -- first letter in key when undefined value input
end Behavioral;
