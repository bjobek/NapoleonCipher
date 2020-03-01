----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2020 13:14:29
-- Design Name: 
-- Module Name: transformation - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transformation is
  Port (
  
  msgData : in std_logic_vector( 4 downto 0);
  keyData : in std_logic_vector( 4 downto 0);
  outData : out std_logic_vector( 4 downto 0);
  clr : in std_logic;
  clk : in std_logic;
  en : in std_logic;
  nOut :out std_logic_vector(4 downto 0)
   );
end transformation;

architecture Behavioral of transformation is

constant alphaMod : unsigned(5 downto 0 ) := "011010";
signal data1,data2 : unsigned (4 downto 0);
--type state_type is (idle, encrypt);
--signal preSt, nxtSt : state_type:= idle;
signal n : unsigned(4 downto 0);
constant alphaOffset : unsigned(5 downto 0) := "011001";
constant KEYSIZE : unsigned(5 downto 0) := "010001";
signal tmp,tmp2 : unsigned (5 downto 0);
begin


----------------------------------------------------------------------------
---State Register
process(clk)
begin
data1<=unsigned(msgData);
data2<=unsigned(keyData);
if (clr = '1') then

--data1 <= (others =>'0');
--data2 <= (others =>'0');
tmp<="000000";
--n <= "00000";
elsif(rising_edge(clk)) then

--preSt <= nxtSt;
--data1<=unsigned(msgData);
--data2<=unsigned(keyData);
-------------
--tmp <=((data2 + (alphaOffset - data1)));
--if (tmp>25) then
--tmp <= (tmp-26);
--end if;
--if(tmp = 26) then
--tmp <= "000000";
--end if;
if (((data2 + (alphaOffset - data1)))>= 26) then
tmp<=(((data2 + (alphaOffset - data1)))-26);
else
tmp<=(((data2 + (alphaOffset - data1))));
end if;


--tmp<= (tmp mod alphaMod);
--outData<=std_logic_vector(tmp(4 downto 0));
end if;

end process;
----------------------------------------------------------------------------
---- n to romK count
process(clk)
begin
if (clr='1') then
n<= (others =>'0');
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


--process(preSt,msgData,keyData)
--begin
--nxtSt <= preSt;
--case preSt is
--when idle =>

--if en='1' then

--nxtSt<=encrypt;
--elsif en='0' then

--end if;

--when encrypt =>

----tmp <=((data2 + (alphaOffset - data1)));
----tmp<= (tmp mod alphaMod);
--n<=(n+1);
--nxtSt<=idle;

--end case;
--end process;

outData<=std_logic_vector(tmp(4 downto 0));
nOut <= std_logic_vector(n);


end Behavioral;
