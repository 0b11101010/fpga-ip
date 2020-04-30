--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
--Date        : Fri May  1 00:24:03 2020
--Host        : erhan-G3-3779 running 64-bit Ubuntu 18.04.4 LTS
--Command     : generate_target bd_0_wrapper.bd
--Design      : bd_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_wrapper is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    xk_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xk_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    xk_tready : in STD_LOGIC;
    xk_tvalid : out STD_LOGIC;
    xn_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xn_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    xn_tready : out STD_LOGIC;
    xn_tvalid : in STD_LOGIC
  );
end bd_0_wrapper;

architecture STRUCTURE of bd_0_wrapper is
  component bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    xk_tvalid : out STD_LOGIC;
    xk_tready : in STD_LOGIC;
    xk_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xk_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    xn_tvalid : in STD_LOGIC;
    xn_tready : out STD_LOGIC;
    xn_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xn_tlast : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_0;
begin
bd_0_i: component bd_0
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      xk_tdata(63 downto 0) => xk_tdata(63 downto 0),
      xk_tlast(0) => xk_tlast(0),
      xk_tready => xk_tready,
      xk_tvalid => xk_tvalid,
      xn_tdata(63 downto 0) => xn_tdata(63 downto 0),
      xn_tlast(0) => xn_tlast(0),
      xn_tready => xn_tready,
      xn_tvalid => xn_tvalid
    );
end STRUCTURE;
