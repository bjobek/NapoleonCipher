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
    Port ( clk,reset, rd_uart,wr_uart : in STD_LOGIC;
           rx:in std_logic;
           w_data: in std_logic_vector(7 downto 0);
           tx_full, rx_empty: out std_logic;
           
           tx : out STD_LOGIC;
           r_data : out std_logic_vector(7 downto 0)
           );
end UART;

architecture Behavioral of UART is
signal tick: std_logic;
signal rx_done_tick: std_logic;
signal tx_fifo_out: std_logic_vector(7 downto 0);
signal rx_data_out: std_logic_vector( 7 downto 0);
signal tx_empty, tx_fifo_not_empty: std_logic;
signal tx_done_tick: std_logic;
begin


end Behavioral;
