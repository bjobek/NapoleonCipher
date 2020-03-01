----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2020 20:30:47
-- Design Name: 
-- Module Name: transformation_tb - Behavioral
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

entity transformation_tb is
--  Port ( );
end transformation_tb;

architecture Behavioral of transformation_tb is
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

signal msgData : std_logic_vector(4 downto 0);
 signal keyData : std_logic_vector( 4 downto 0);
 signal clr : std_logic;
signal  clk : std_logic;
  signal en : std_logic;
 signal outdata,nout : std_logic_vector(4 downto 0);
constant clock_time : time := 10ns;
begin

uut:transformation
port map(
msgdata=>msgdata, keydata=>keydata, outdata =>outdata, nout=>nout,
clr=>clr, clk=>clk, en=>en
);

clk_proc : process
begin
clk<='0';
wait for clock_time/2;
clk<='1';
wait for clock_time/2;
end process;
process
begin
en<='1';

clr<='1';

wait for clock_time;
clr<='0';

msgData<="00010"; 
keyData<="00000"; 
wait for clock_time*2;

msgData<="00010"; 
keyData<="00001"; 
wait for clock_time*2;

msgData<="00010"; 
keyData<="00010"; 
wait for clock_time*2;

msgData<="00010"; 
keyData<="00011"; 
wait for clock_time*2;

msgData<="00010"; 
keyData<="00100"; 
wait for clock_time*2;

msgData<="00010"; 
keyData<="00101"; 
wait for clock_time*2;
end process;


end Behavioral;
