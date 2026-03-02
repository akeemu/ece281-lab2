----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2026 10:00:04 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
--  Port ( );
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
    
    component sevenseg_decoder is
        Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component sevenseg_decoder;
    
    signal w_i_Hex   : std_logic_vector(3 downto 0) := "0000";
    signal w_o_seg_n : std_logic_vector(6 downto 0);
    
begin
    sevenseg_decoder_uut : sevenseg_decoder port map (
        i_Hex => w_i_Hex,
        o_seg_n => w_o_seg_n
    );
    
    test_process : process
    begin
        -- test 0
        w_i_Hex <= x"0"; wait for 50 ns;
            assert (w_o_seg_n = "1000000") report "bad hex 0" severity failure;
        -- test 1
        w_i_Hex <= x"1"; wait for 50 ns;
            assert (w_o_seg_n = "1111001") report "bad hex 1" severity failure;
        -- test 2
        w_i_Hex <= x"2"; wait for 50 ns;
            assert (w_o_seg_n = "0100100") report "bad hex 2" severity failure;
        -- test 4
        w_i_Hex <= x"4"; wait for 50 ns;
            assert (w_o_seg_n = "0011001") report "bad hex 4" severity failure;
        -- test 8
        w_i_Hex <= x"8"; wait for 50 ns;
            assert (w_o_seg_n = "0000000") report "bad hex 8" severity failure;
        -- test 9
        w_i_Hex <= x"9"; wait for 50 ns;
            assert (w_o_seg_n = "0011000") report "bad hex 9" severity failure;
        -- test A
        w_i_Hex <= x"A"; wait for 50 ns;
            assert (w_o_seg_n = "0001000") report "bad hex A" severity failure;
        -- test D
        w_i_Hex <= x"D"; wait for 50 ns;
            assert (w_o_seg_n = "0100001") report "bad hex D" severity failure;
        -- test F
        w_i_Hex <= x"F"; wait for 50 ns;
            assert (w_o_seg_n = "0001110") report "bad hex F" severity failure;
        wait;
    end process;

end test_bench;
