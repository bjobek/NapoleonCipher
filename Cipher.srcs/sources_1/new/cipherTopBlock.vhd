----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2020 15:33:22
-- Design Name: 
-- Module Name: cipherTopBlock - Behavioral
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

entity cipherTopBlock is
    Port (-- keyData : in STD_LOGIC_VECTOR (4 downto 0);
           msgData : in STD_LOGIC_VECTOR (7 downto 0);
           clk,clr,en : in STD_LOGIC;
           outData : out STD_LOGIC_VECTOR (4 downto 0));-- will be byte size later
end cipherTopBlock;

architecture Behavioral of cipherTopBlock is



component romA is
  Port (
  asciiCode : in std_logic_vector(7 downto 0);
  offset : out std_logic_vector(4 downto 0)
   );
end component;


component romK is
  Port (
  keyIndex : in std_logic_vector(4 downto 0);
  keyOffsetOut : out std_logic_vector(4 downto 0)
   );
end component;
component transformation is
  Port (
  
  msgData : in std_logic_vector( 4 downto 0);
  keyData : in std_logic_vector( 4 downto 0);
  outData,nOut : out std_logic_vector( 4 downto 0);
  clr : in std_logic;
  clk : in std_logic;
  en : in std_logic
   );
end component;


signal msgInput, keyIncrement,keyData : std_logic_vector(4 downto 0);

begin

asciiRom : romA
port map(
asciiCode => msgData, offset=>msgInput
);

keyRom : romK
port map(keyIndex => keyIncrement , keyOffsetOut => keyData);

cipherTrans: transformation
port map( clr=>clr, clk=>clk, en=>en, msgData=>msgInput, keyData =>keyData, nOut=>keyIncrement,outData=>outData
);




end Behavioral;
