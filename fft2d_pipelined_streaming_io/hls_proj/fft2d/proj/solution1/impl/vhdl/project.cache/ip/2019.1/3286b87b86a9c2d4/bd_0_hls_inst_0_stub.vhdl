-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Fri May  1 00:27:13 2020
-- Host        : erhan-G3-3779 running 64-bit Ubuntu 18.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    xn_TVALID : in STD_LOGIC;
    xn_TREADY : out STD_LOGIC;
    xn_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xn_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    xk_TVALID : out STD_LOGIC;
    xk_TREADY : in STD_LOGIC;
    xk_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xk_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,xn_TVALID,xn_TREADY,xn_TDATA[63:0],xn_TLAST[0:0],xk_TVALID,xk_TREADY,xk_TDATA[63:0],xk_TLAST[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fft2d_top,Vivado 2019.1";
begin
end;
