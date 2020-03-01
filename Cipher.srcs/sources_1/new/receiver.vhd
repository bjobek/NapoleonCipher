----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2020 13:53:57
-- Design Name: 
-- Module Name: receiver - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- s-register keeps track of sampling ticks
-- n-register keeps track of data bits received in data state
-- 19200 baud rate

entity receiver is
generic(
DBIT: integer:=8; -- data 
SBTICK : integer := 16 -- ticks, only used in stop bits (varies)
);
-- we use 8 d bits, 1 start bit, 1 stop bit, no parity

  Port (
  clk,rst,rx,sTick : in std_logic;
  
  rxDoneTick : out std_logic;
  dout : out std_logic_vector(7 downto 0)
   );
end receiver;

architecture Behavioral of receiver is
type stateType is (idle,start,data,stop);
signal stateReg,stateNxt : stateType;
signal sReg,sNxt : unsigned (3 downto 0);
signal nReg,nNxt : unsigned (2 downto 0);
signal bReg,bNxt : unsigned (7 downto 0);

begin


-- top view states cycle
process(clk, rst)
begin
if (rst='1') then
stateReg <= idle;
sReg<= (others=>'0');
nReg<= (others=>'0');
bReg<= (others=>'0');
elsif (clk'event and clk='1') then
stateReg <= stateNxt;
sReg<= sNxt;
nReg<= nNxt;
bReg<= bNxt;
end if;
end process;
-- next state logic
process(stateReg,sReg,nReg,bReg, sTick,rx)
begin
stateNxt<=stateReg;
sNxt<=sReg;
bNxt<=bReg;
nNxt<=nReg;

case stateReg is
when idle =>
if rx='0' then
    stateNxt <= start;
    sNxt <= (others=>'0');
end if;
when start =>
if (sTick = '1') then
    if sReg=7 then
    stateNxt <= data;
    sNxt <= (others=>'0');
    nNxt <=(others=>'0');
    else
        sNxt <= sReg +1;
    end if;
end if;
when data =>
if (sTick = '1') then
    if sReg = 15 then
    sNxt <= (others =>'0');
    bNxt <= rx & bReg(7 downto 1); -- rightshift msb
    if nReg = (DBIT-1) then 
        stateNxt<=stop; -- reached last data bit
    else
        nNxt <= nReg + 1; -- increase data bits recv in register
    end if;
    else
        sNxt <= sReg + 1; -- not yet reached 15, will not rst tick register
    end if;
    end if;
when stop =>
if(sTick = '1') then
    if sReg = (SBTICK -1) then
        stateNxt <= idle;
        rxDoneTick <= '1';
    else 
        sNxt <= sReg + 1;
    end if;
end if;
end case;
end process;

end Behavioral;
