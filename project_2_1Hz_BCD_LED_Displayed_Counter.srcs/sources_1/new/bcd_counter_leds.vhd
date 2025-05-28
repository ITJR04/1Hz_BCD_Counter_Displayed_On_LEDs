----------------------------------------------------------------------------------
-- Company: University of Connecticut
-- Engineer: Isai Torres
-- 
-- Create Date: 05/27/2025 04:29:25 PM
-- Design Name: BCD Counter LED Display
-- Module Name: bcd_counter_leds - Behavioral
-- Project Name: 1Hz BCD LED Counter Displayed
-- Target Devices: Zedbaord Zynq-7000 (XC7Z020-1CLG484C)
-- Tool Versions: Vivado 2024.2
-- Description: 
--  This module implements a Binary Coded Decimal (BCD) counter that drives a 4-bit LED output
-- The counter increments at 1Hz rate based on the clock frequency and SEC_COUNT input values.
-- 
-- Dependencies: NONE
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Make sure CLK_FREQ and SEC_COUNT are appropriately restricted for timing accuracy
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_counter_leds is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        leds : out std_logic_vector(3 downto 0)); -- using 4 leds for 9 since it takes 4 binary bits minimum to display 9
end bcd_counter_leds;

architecture Behavioral of bcd_counter_leds is
    constant CLK_FREQ : integer:= 100_000_000; -- 100MHz for Zedboard
    constant SEC_COUNT : integer := CLK_FREQ; -- gives value of CLK_FREQ
    
    signal clk_en : std_logic := '0';
    signal count : integer range 0 to SEC_COUNT - 1;
    signal bcd : std_logic_vector(3 downto 0) := "0000";
    
begin
    -- Enable generator (1 Hz)
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count <= 0;
                clk_en <= '0';
            elsif count = SEC_COUNT - 1 then -- once we reach 100_000_000 - 1
                count <= 0; -- we reset count
                clk_en <= '1'; -- flag that we have reached the enable to increment change bcd count
            else 
                count <= count + 1;
                clk_en <= '0';
            end if;
       end if;
    end process;
    
    -- BCD counter
    process(clk)
    begin
        if rising_edge(clk) then 
            if reset = '1' then
                bcd <= "0000";
            elsif clk_en = '1' then -- indicates we have reached max count
                if bcd = "1001" then -- if BCD counter at max value of 9
                    bcd <= "0000"; -- resets back to zero since count is from 0 to 9
                else
                    bcd <= std_logic_vector(unsigned(bcd) + 1); -- concatenation for vector to be added by one as integer then transformed back into vector
                end if;
            end if;
        end if;
    end process;

    leds <= bcd;
end Behavioral;
