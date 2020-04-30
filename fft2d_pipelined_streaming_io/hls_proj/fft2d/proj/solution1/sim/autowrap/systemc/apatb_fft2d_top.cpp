// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->
    typedef struct  {
        float real;
        float imag;
       } DATA_t;

          typedef struct  {
              DATA_t data;
              bool last;
             } AXIS_t;



// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "xn_data"
#define AUTOTB_TVIN_xn_data  "../tv/cdatafile/c.fft2d_top.autotvin_xn_data.dat"
// wrapc file define: "xn_last"
#define AUTOTB_TVIN_xn_last  "../tv/cdatafile/c.fft2d_top.autotvin_xn_last.dat"
// wrapc file define: "xk_data"
#define AUTOTB_TVOUT_xk_data  "../tv/cdatafile/c.fft2d_top.autotvout_xk_data.dat"
#define AUTOTB_TVIN_xk_data  "../tv/cdatafile/c.fft2d_top.autotvin_xk_data.dat"
// wrapc file define: "xk_last"
#define AUTOTB_TVOUT_xk_last  "../tv/cdatafile/c.fft2d_top.autotvout_xk_last.dat"
#define AUTOTB_TVIN_xk_last  "../tv/cdatafile/c.fft2d_top.autotvin_xk_last.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "xk_data"
#define AUTOTB_TVOUT_PC_xk_data  "../tv/rtldatafile/rtl.fft2d_top.autotvout_xk_data.dat"
// tvout file define: "xk_last"
#define AUTOTB_TVOUT_PC_xk_last  "../tv/rtldatafile/rtl.fft2d_top.autotvout_xk_last.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			xn_data_depth = 0;
			xn_last_depth = 0;
			xk_data_depth = 0;
			xk_last_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{xn_data " << xn_data_depth << "}\n";
			total_list << "{xn_last " << xn_last_depth << "}\n";
			total_list << "{xk_data " << xk_data_depth << "}\n";
			total_list << "{xk_last " << xk_last_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int xn_data_depth;
		int xn_last_depth;
		int xk_data_depth;
		int xk_last_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void fft2d_top (
AXIS_t xn[1024],
AXIS_t xk[1024]);

void AESL_WRAP_fft2d_top (
AXIS_t xn[1024],
AXIS_t xk[1024])
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "xk_data"
		aesl_fh.read(AUTOTB_TVOUT_PC_xk_data, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_xk_data, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_xk_data, AESL_token); // data

			sc_bv<64> *xk_data_pc_buffer = new sc_bv<64>[1024];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'xk_data', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'xk_data', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					xk_data_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_xk_data, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_xk_data))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: xk_data
				{
					// bitslice(31, 0)
					// {
						// celement: xk.data.real(31, 0)
						// {
							sc_lv<32>* xk_data_real_lv0_0_1023_1 = new sc_lv<32>[1024];
						// }
					// }
					// bitslice(63, 32)
					// {
						// celement: xk.data.imag(31, 0)
						// {
							sc_lv<32>* xk_data_imag_lv0_0_1023_1 = new sc_lv<32>[1024];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: xk.data.real(31, 0)
						{
							// carray: (0) => (1023) @ (1)
							for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
							{
								if (&(xk[0].data.real) != NULL) // check the null address if the c port is array or others
								{
									xk_data_real_lv0_0_1023_1[hls_map_index].range(31, 0) = sc_bv<32>(xk_data_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}
					// bitslice(63, 32)
					{
						int hls_map_index = 0;
						// celement: xk.data.imag(31, 0)
						{
							// carray: (0) => (1023) @ (1)
							for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
							{
								if (&(xk[0].data.imag) != NULL) // check the null address if the c port is array or others
								{
									xk_data_imag_lv0_0_1023_1[hls_map_index].range(31, 0) = sc_bv<32>(xk_data_pc_buffer[hls_map_index].range(63, 32));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: xk.data.real(31, 0)
						{
							// carray: (0) => (1023) @ (1)
							for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : xk[i_0].data.real
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : xk[0].data.real
								// output_left_conversion : *(int*)&xk[i_0].data.real
								// output_type_conversion : (xk_data_real_lv0_0_1023_1[hls_map_index]).to_uint64()
								if (&(xk[0].data.real) != NULL) // check the null address if the c port is array or others
								{
									*(int*)&xk[i_0].data.real = (xk_data_real_lv0_0_1023_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
					// bitslice(63, 32)
					{
						int hls_map_index = 0;
						// celement: xk.data.imag(31, 0)
						{
							// carray: (0) => (1023) @ (1)
							for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : xk[i_0].data.imag
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : xk[0].data.imag
								// output_left_conversion : *(int*)&xk[i_0].data.imag
								// output_type_conversion : (xk_data_imag_lv0_0_1023_1[hls_map_index]).to_uint64()
								if (&(xk[0].data.imag) != NULL) // check the null address if the c port is array or others
								{
									*(int*)&xk[i_0].data.imag = (xk_data_imag_lv0_0_1023_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] xk_data_pc_buffer;
		}

		// output port post check: "xk_last"
		aesl_fh.read(AUTOTB_TVOUT_PC_xk_last, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_xk_last, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_xk_last, AESL_token); // data

			sc_bv<1> *xk_last_pc_buffer = new sc_bv<1>[1024];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'xk_last', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'xk_last', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					xk_last_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_xk_last, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_xk_last))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: xk_last
				{
					// bitslice(0, 0)
					// {
						// celement: xk.last(0, 0)
						// {
							sc_lv<1>* xk_last_lv0_0_1023_1 = new sc_lv<1>[1024];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: xk.last(0, 0)
						{
							// carray: (0) => (1023) @ (1)
							for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
							{
								if (&(xk[0].last) != NULL) // check the null address if the c port is array or others
								{
									xk_last_lv0_0_1023_1[hls_map_index].range(0, 0) = sc_bv<1>(xk_last_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: xk.last(0, 0)
						{
							// carray: (0) => (1023) @ (1)
							for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : xk[i_0].last
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : xk[0].last
								// output_left_conversion : xk[i_0].last
								// output_type_conversion : (xk_last_lv0_0_1023_1[hls_map_index]).to_uint64()
								if (&(xk[0].last) != NULL) // check the null address if the c port is array or others
								{
									xk[i_0].last = (xk_last_lv0_0_1023_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] xk_last_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "xn_data"
		char* tvin_xn_data = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_xn_data);

		// "xn_last"
		char* tvin_xn_last = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_xn_last);

		// "xk_data"
		char* tvin_xk_data = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_xk_data);
		char* tvout_xk_data = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_xk_data);

		// "xk_last"
		char* tvin_xk_last = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_xk_last);
		char* tvout_xk_last = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_xk_last);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_xn_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_xn_data, tvin_xn_data);

		sc_bv<64>* xn_data_tvin_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: xn_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: xn.data.real(31, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xn[i_0].data.real
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xn[0].data.real
						// regulate_c_name       : xn_data_real
						// input_type_conversion : *(int*)&xn[i_0].data.real
						if (&(xn[0].data.real) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> xn_data_real_tmp_mem;
							xn_data_real_tmp_mem = *(int*)&xn[i_0].data.real;
							xn_data_tvin_wrapc_buffer[hls_map_index].range(31, 0) = xn_data_real_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
			// bitslice(63, 32)
			{
				int hls_map_index = 0;
				// celement: xn.data.imag(31, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xn[i_0].data.imag
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xn[0].data.imag
						// regulate_c_name       : xn_data_imag
						// input_type_conversion : *(int*)&xn[i_0].data.imag
						if (&(xn[0].data.imag) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> xn_data_imag_tmp_mem;
							xn_data_imag_tmp_mem = *(int*)&xn[i_0].data.imag;
							xn_data_tvin_wrapc_buffer[hls_map_index].range(63, 32) = xn_data_imag_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_xn_data, "%s\n", (xn_data_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_xn_data, tvin_xn_data);
		}

		tcl_file.set_num(1024, &tcl_file.xn_data_depth);
		sprintf(tvin_xn_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_xn_data, tvin_xn_data);

		// release memory allocation
		delete [] xn_data_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_xn_last, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_xn_last, tvin_xn_last);

		sc_bv<1>* xn_last_tvin_wrapc_buffer = new sc_bv<1>[1024];

		// RTL Name: xn_last
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: xn.last(0, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xn[i_0].last
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xn[0].last
						// regulate_c_name       : xn_last
						// input_type_conversion : xn[i_0].last
						if (&(xn[0].last) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> xn_last_tmp_mem;
							xn_last_tmp_mem = xn[i_0].last;
							xn_last_tvin_wrapc_buffer[hls_map_index].range(0, 0) = xn_last_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_xn_last, "%s\n", (xn_last_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_xn_last, tvin_xn_last);
		}

		tcl_file.set_num(1024, &tcl_file.xn_last_depth);
		sprintf(tvin_xn_last, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_xn_last, tvin_xn_last);

		// release memory allocation
		delete [] xn_last_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_xk_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_xk_data, tvin_xk_data);

		sc_bv<64>* xk_data_tvin_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: xk_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: xk.data.real(31, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xk[i_0].data.real
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xk[0].data.real
						// regulate_c_name       : xk_data_real
						// input_type_conversion : *(int*)&xk[i_0].data.real
						if (&(xk[0].data.real) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> xk_data_real_tmp_mem;
							xk_data_real_tmp_mem = *(int*)&xk[i_0].data.real;
							xk_data_tvin_wrapc_buffer[hls_map_index].range(31, 0) = xk_data_real_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
			// bitslice(63, 32)
			{
				int hls_map_index = 0;
				// celement: xk.data.imag(31, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xk[i_0].data.imag
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xk[0].data.imag
						// regulate_c_name       : xk_data_imag
						// input_type_conversion : *(int*)&xk[i_0].data.imag
						if (&(xk[0].data.imag) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> xk_data_imag_tmp_mem;
							xk_data_imag_tmp_mem = *(int*)&xk[i_0].data.imag;
							xk_data_tvin_wrapc_buffer[hls_map_index].range(63, 32) = xk_data_imag_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_xk_data, "%s\n", (xk_data_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_xk_data, tvin_xk_data);
		}

		tcl_file.set_num(1024, &tcl_file.xk_data_depth);
		sprintf(tvin_xk_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_xk_data, tvin_xk_data);

		// release memory allocation
		delete [] xk_data_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_xk_last, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_xk_last, tvin_xk_last);

		sc_bv<1>* xk_last_tvin_wrapc_buffer = new sc_bv<1>[1024];

		// RTL Name: xk_last
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: xk.last(0, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xk[i_0].last
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xk[0].last
						// regulate_c_name       : xk_last
						// input_type_conversion : xk[i_0].last
						if (&(xk[0].last) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> xk_last_tmp_mem;
							xk_last_tmp_mem = xk[i_0].last;
							xk_last_tvin_wrapc_buffer[hls_map_index].range(0, 0) = xk_last_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_xk_last, "%s\n", (xk_last_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_xk_last, tvin_xk_last);
		}

		tcl_file.set_num(1024, &tcl_file.xk_last_depth);
		sprintf(tvin_xk_last, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_xk_last, tvin_xk_last);

		// release memory allocation
		delete [] xk_last_tvin_wrapc_buffer;

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		fft2d_top(xn, xk);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_xk_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_xk_data, tvout_xk_data);

		sc_bv<64>* xk_data_tvout_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: xk_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: xk.data.real(31, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xk[i_0].data.real
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xk[0].data.real
						// regulate_c_name       : xk_data_real
						// input_type_conversion : *(int*)&xk[i_0].data.real
						if (&(xk[0].data.real) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> xk_data_real_tmp_mem;
							xk_data_real_tmp_mem = *(int*)&xk[i_0].data.real;
							xk_data_tvout_wrapc_buffer[hls_map_index].range(31, 0) = xk_data_real_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
			// bitslice(63, 32)
			{
				int hls_map_index = 0;
				// celement: xk.data.imag(31, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xk[i_0].data.imag
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xk[0].data.imag
						// regulate_c_name       : xk_data_imag
						// input_type_conversion : *(int*)&xk[i_0].data.imag
						if (&(xk[0].data.imag) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> xk_data_imag_tmp_mem;
							xk_data_imag_tmp_mem = *(int*)&xk[i_0].data.imag;
							xk_data_tvout_wrapc_buffer[hls_map_index].range(63, 32) = xk_data_imag_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvout_xk_data, "%s\n", (xk_data_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_xk_data, tvout_xk_data);
		}

		tcl_file.set_num(1024, &tcl_file.xk_data_depth);
		sprintf(tvout_xk_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_xk_data, tvout_xk_data);

		// release memory allocation
		delete [] xk_data_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_xk_last, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_xk_last, tvout_xk_last);

		sc_bv<1>* xk_last_tvout_wrapc_buffer = new sc_bv<1>[1024];

		// RTL Name: xk_last
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: xk.last(0, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : xk[i_0].last
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : xk[0].last
						// regulate_c_name       : xk_last
						// input_type_conversion : xk[i_0].last
						if (&(xk[0].last) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> xk_last_tmp_mem;
							xk_last_tmp_mem = xk[i_0].last;
							xk_last_tvout_wrapc_buffer[hls_map_index].range(0, 0) = xk_last_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvout_xk_last, "%s\n", (xk_last_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_xk_last, tvout_xk_last);
		}

		tcl_file.set_num(1024, &tcl_file.xk_last_depth);
		sprintf(tvout_xk_last, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_xk_last, tvout_xk_last);

		// release memory allocation
		delete [] xk_last_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "xn_data"
		delete [] tvin_xn_data;
		// release memory allocation: "xn_last"
		delete [] tvin_xn_last;
		// release memory allocation: "xk_data"
		delete [] tvout_xk_data;
		delete [] tvin_xk_data;
		// release memory allocation: "xk_last"
		delete [] tvout_xk_last;
		delete [] tvin_xk_last;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

