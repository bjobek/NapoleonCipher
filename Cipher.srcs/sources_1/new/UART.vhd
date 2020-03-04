----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2020 13:46:07
-- Design Name: 
-- Module Name: UART - Behavioral
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
use ieee.numeric_std.all;

-- 19200 baud, 8 db, 1 sb, 4 fifo

entity UART is
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
end UART;
architecture Behavioral of UART is
component transmitter is
generic(
DBIT : integer :=8; -- data bits
SB_TICK : integer := 16 -- ticks for stop bit
);
 Port (
 clk,reset: in std_logic;
 tx_start : in std_logic;
 s_tick : in std_logic;
 din : in std_logic_vector(7 downto 0);
 tx_done_tick : out std_logic;
 tx: out std_logic
  );
end component;
component receiver is
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
end component;

component interfaceCircuit is
generic(W: integer := 8);
  Port (
  clk,reset: in std_logic;
  clr_flag, set_flag : in std_logic;
  din: in std_logic_vector(W-1 downto 0);
  dout: out std_logic_vector(W-1 downto 0);
  flag: out std_logic
   );
end component;

component baudRateGenerator is
generic(N: integer := DVSR_BIT);
  Port (
  clk,reset: in std_logic;
  max_tick: out std_logic;
  q: out std_logic_vector(N-1 downto 0)
   );
end component;

signal tick: std_logic;
signal rx_done_tick: std_logic;
signal tx_fifo_out: std_logic_vector(7 downto 0);
signal rx_data_out: std_logic_vector( 7 downto 0);
signal tx_empty, tx_fifo_not_empty: std_logic;
signal tx_done_tick: std_logic;
begin

rx_unit : receiver
port map
(
clk=>clk, rst=>reset, rx=>rx, sTick=>tick, rxDoneTick=>rx_done_tick, dout=>rx_data_out
);
rx_buffer_interface : interfaceCircuit
port map
(
clk=>clk, reset=>reset, din=>rx_data_out, dout=>r_data, set_flag=>rx_done_tick, clr_flag=>rd_uart, flag=>rx_has_data
);
tx_unit: transmitter
port map
(
clk=>clk, reset=>reset, tx_start=>tx_fifo_not_empty, s_tick=>tick, din=> tx_fifo_out, tx_done_tick=>tx_done_tick, tx=>tx
);
tx_buffer_interface: interfaceCircuit
port map
(
clk=>clk, reset=>reset,flag=>tx_fifo_not_empty, din=>w_data, set_flag=>wr_uart, dout=>tx_fifo_out, clr_flag=>tx_done_tick
);
baud_generator : baudRateGenerator
port map
(
clk=> clk, reset=> reset, max_tick=>tick, q=>open
);


end Behavioral;
