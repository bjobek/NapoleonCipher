----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2020 15:49:31
-- Design Name: 
-- Module Name: UART_tb - Behavioral
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

entity UART_tb is
--  Port ( );
end UART_tb;

architecture Behavioral of UART_tb is

component UART is
    generic
    (
    DBIT: integer := 8;
    SB_TICK: INTEGER := 16;
    DVSR: INTEGER := 326;
    DVSR_BIT : INTEGER := 9;
    FIFO_W : INTEGER:=2
    );
    Port ( clk,reset : in std_logic;
         rd_uart,wr_uart : in STD_LOGIC;
           rx:in std_logic;
           w_data: in std_logic_vector(7 downto 0);
          -- tx_full : out std_logic;
            rx_has_data: out std_logic;
           
           tx : out STD_LOGIC;
           r_data : out std_logic_vector(7 downto 0)
           );
end component;

signal clk, reset, rd_uart, wr_uart, rx, rx_has_data,tx : std_logic;
signal w_data, r_data:  std_logic_vector(7 downto 0);
constant clock_time : time := 10ns;
begin

uut: UART
port map
(
clk => clk, reset=>reset, rd_uart=>rd_uart, wr_uart=>wr_uart, rx=>rx, w_data=>w_data, rx_has_data=>rx_has_data, tx=>tx, r_data=>r_data
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
reset<='1';
rd_uart<='0';
wr_uart<='0';
w_data<=(others=>'0');

wait for clock_time;
reset<='0';
rx<='1';
wait for clock_time;
rx<='0';
wait for clock_time*1000;
rx<='1';
wait for clock_time*5;
rx<='0';
wait for clock_time*3;
rx<='1';
wait for clock_time*10;



end process;

end Behavioral;
