-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: EA:hls:fft2d_top:1.0
-- IP Revision: 2005010023

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bd_0_hls_inst_0 IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    xn_TVALID : IN STD_LOGIC;
    xn_TREADY : OUT STD_LOGIC;
    xn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    xn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    xk_TVALID : OUT STD_LOGIC;
    xk_TREADY : IN STD_LOGIC;
    xk_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    xk_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END bd_0_hls_inst_0;

ARCHITECTURE bd_0_hls_inst_0_arch OF bd_0_hls_inst_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF bd_0_hls_inst_0_arch: ARCHITECTURE IS "yes";
  COMPONENT fft2d_top IS
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      xn_TVALID : IN STD_LOGIC;
      xn_TREADY : OUT STD_LOGIC;
      xn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      xn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      xk_TVALID : OUT STD_LOGIC;
      xk_TREADY : IN STD_LOGIC;
      xk_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      xk_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT fft2d_top;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF bd_0_hls_inst_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF xk_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 xk TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF xk_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 xk TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF xk_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 xk TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF xk_TVALID: SIGNAL IS "XIL_INTERFACENAME xk, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 400000000.0, PHASE 0.000, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF xk_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 xk TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF xn_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 xn TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF xn_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 xn TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF xn_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 xn TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF xn_TVALID: SIGNAL IS "XIL_INTERFACENAME xn, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 400000000.0, PHASE 0.000, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF xn_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 xn TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF xn:xk, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 400000000.0, PHASE 0.000, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : fft2d_top
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      xn_TVALID => xn_TVALID,
      xn_TREADY => xn_TREADY,
      xn_TDATA => xn_TDATA,
      xn_TLAST => xn_TLAST,
      xk_TVALID => xk_TVALID,
      xk_TREADY => xk_TREADY,
      xk_TDATA => xk_TDATA,
      xk_TLAST => xk_TLAST
    );
END bd_0_hls_inst_0_arch;
