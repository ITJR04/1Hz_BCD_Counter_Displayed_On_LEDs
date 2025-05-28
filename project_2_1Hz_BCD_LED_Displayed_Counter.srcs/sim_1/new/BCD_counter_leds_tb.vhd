----------------------------------------------------------------------------------
-- Company: University of Connecticut
-- Engineer: Isai Torres
-- 
-- Create Date: 05/27/2025 04:59:33 PM
-- Design Name: BCD Counter LED Testbench
-- Module Name: BCD_counter_leds_tb - Behavioral
-- Project Name: 1Hz BCD LED Counter Displayed
-- Target Devices: Zedbaord Zynq-7000 ( XC7Z020-1CLG484C)
-- Tool Versions: Vivado 2024.2
-- Description: 
--  This is a VHDL testbench for simulating the BCD_counter_leds module.
--  It generates a clock and reset signal and observes a 4-bit LED output for correct counting behavior
-- Dependencies: bcd_counter_leds.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Ensure for testing purposes the SEC_COUNT is set lower for quicker simulation.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_counter_leds_tb is
--  Port ( );
end BCD_counter_leds_tb;

architecture Behavioral of BCD_counter_leds_tb is
component bcd_counter_leds
port (
    clk : in std_logic;
    reset : in std_logic;
    leds : out std_logic_vector(3 downto 0));
end component;
signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal leds : std_logic_vector(3 downto 0) := "0000";
constant clk_period : time := 10ns;

begin

uut : bcd_counter_leds port map(
    clk => clk,
    reset => reset,
    leds => leds);

clk_process: process
begin
    while true loop
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end loop;
end process clk_process;

stim_proc: process
begin
    reset <= '1';
    wait for 20ns;
    reset <= '0';
    wait until leds <= "0001";
    report "LED turned ON 1" severity note;
    wait until leds <= "0010";
    report "LED turned ON 2" severity note;
    wait until leds <= "0011";
    report "LED turned ON 3" severity note;
    wait until leds <= "0100";
    report "LED turned ON 4" severity note;
    wait until leds <= "0101";
    report "LED turned ON 5" severity note;
    wait until leds <= "0110";
    report "LED turned ON 6" severity note;
    wait until leds <= "0111";
    report "LED turned ON 7" severity note;
    wait until leds <= "1000";
    report "LED turned ON 8" severity note;
    wait until leds <= "1001";
    report "LED turned ON 9" severity note;
    wait until leds <= "0000";
    report "BCD counter reset" severity note;
    wait;
end process stim_proc;
    

end Behavioral;
