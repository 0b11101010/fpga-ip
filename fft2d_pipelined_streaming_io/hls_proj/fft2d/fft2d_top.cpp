/* author : erhan.akagunduz - erhan.akagunduz@gmail.com */

#include <complex>
#include "hls_stream.h"
#include "fft2d_top.h"

static void push_fft1d_fifo(config_t* config, hls::stream<DATA_t>& in, std::complex<data_t> out[FFT_LENGTH]);
static void pop_fft1d_fifo(std::complex<data_t>  in[FFT_LENGTH], hls::stream<DATA_t>& out);
static void fft1d(uint8_t instance, hls::stream<DATA_t>& in, hls::stream<DATA_t>& out);

void push_fft1d_fifo(
	config_t* config,
	hls::stream<DATA_t>& in,
	std::complex<data_t> out[FFT_LENGTH])
{

#pragma HLS INLINE

	config->setDir(1);
    for (size_t i=0; i< FFT_LENGTH; i++)
    {
#pragma HLS PIPELINE

        DATA_t tmp;
        in.read(tmp);
        out[i] = std::complex<data_t>(tmp.real, tmp.imag);
    }
}

void pop_fft1d_fifo(
	std::complex<data_t>  in[FFT_LENGTH],
	hls::stream<DATA_t>& out)
{
#pragma HLS INLINE

    for (size_t i = 0; i < FFT_LENGTH; i++)
    {
#pragma HLS PIPELINE

    	DATA_t tmp_data;
    	std::complex<data_t> tmp_complex = in[i];
    	tmp_data.real = tmp_complex.real();
    	tmp_data.imag = tmp_complex.imag();
        out.write(tmp_data);
    }
}

void fft1d(uint8_t instance, hls::stream<DATA_t>& in, hls::stream<DATA_t>& out)
{
#pragma HLS function_instantiate variable=instance

	std::complex<data_t> xn[FFT_LENGTH];
	std::complex<data_t> xk[FFT_LENGTH];
#pragma HLS stream variable=_xn depth=FFT_LENGTH
#pragma HLS stream variable=_xk depth=FFT_LENGTH

	config_t config;
	status_t status;

#pragma HLS interface ap_fifo port=config
#pragma HLS interface ap_fifo port=status
#pragma HLS stream variable=config depth=1
#pragma HLS stream variable=status depth=1

#pragma HLS dataflow

	push_fft1d_fifo(&config, in, xn);
	hls::fft<struct configuration>(xn, xk, &status, &config);
	pop_fft1d_fifo(xk, out);
}


void fft2d_top(AXIS_t xn[FFT_2D_LENGTH], AXIS_t xk[FFT_2D_LENGTH])
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis depth=FFT_2D_LENGTH port=xn
#pragma HLS INTERFACE axis depth=FFT_2D_LENGTH port=xk
#pragma HLS data_pack variable=xn
#pragma HLS data_pack variable=xk

	hls::stream<DATA_t> xn_fifo;
#pragma HLS stream variable=xn_fifo depth=FFT_LENGTH
#pragma HLS data_pack variable=xn_fifo

	hls::stream<DATA_t> xn_mid_row_fifo;
#pragma HLS stream variable=xn_mid_row_fifo depth=FFT_LENGTH
#pragma HLS data_pack variable=xn_mid_row_fifo

	hls::stream<DATA_t> xk_mid_row_fifo;
#pragma HLS stream variable=xk_mid_row_fifo depth=FFT_LENGTH
#pragma HLS data_pack variable=xk_mid_row_fifo

	hls::stream<DATA_t> xn_mid_col_fifo;
#pragma HLS stream variable=xn_mid_col_fifo depth=FFT_LENGTH
#pragma HLS data_pack variable=xn_mid_col_fifo

	hls::stream<DATA_t> xk_mid_col_fifo;
#pragma HLS stream variable=xk_mid_col_fifo depth=FFT_LENGTH
#pragma HLS data_pack variable=xk_mid_col_fifo

	hls::stream<DATA_t> xk_fifo;
#pragma HLS stream variable=xk_fifo depth=FFT_LENGTH
#pragma HLS data_pack variable=xk_fifo

	DATA_t arr0[FFT_2D_LENGTH];
#pragma HLS RESOURCE variable=arr0 core=RAM_2P_URAM
//#pragma HLS RESOURCE variable=arr0 core=RAM_2P_BRAM
#pragma HLS data_pack variable=arr0

	DATA_t arr1[FFT_2D_LENGTH];
#pragma HLS RESOURCE variable=arr1 core=RAM_2P_URAM
//#pragma HLS RESOURCE variable=arr1 core=RAM_2P_BRAM
#pragma HLS data_pack variable=arr1

#pragma HLS DATAFLOW

l_rd_xn:
	for (size_t i = 0; i < FFT_2D_LENGTH; i++)
	{
#pragma HLS PIPELINE

		AXIS_t s_axis = xn[i];
		xn_fifo.write(s_axis.data);
	}


l_f1d_row:
	for (size_t i = 0; i < FFT_LENGTH; i++)
	{
		for (size_t j = 0; j < FFT_LENGTH; j++)
		{
			DATA_t tmp;
			xn_fifo.read(tmp);
			xn_mid_row_fifo.write(tmp);
		}

		fft1d(1U, xn_mid_row_fifo, xk_mid_row_fifo);

	}

l_transp_mid:
	for (size_t i = 0; i < FFT_LENGTH; i++)
	{
		for (size_t j = 0; j < FFT_LENGTH; j++)
		{
#pragma HLS PIPELINE

			uint16_t index = (uint16_t)j * (uint16_t)FFT_LENGTH + (uint16_t)i;
			xk_mid_row_fifo.read(arr0[index]);
		}
	}


l_f1d_col:
	for (size_t i = 0; i < FFT_LENGTH; i++)
	{
		for (size_t j = 0; j < FFT_LENGTH; j++)
		{
			uint16_t index = (uint16_t)i * (uint16_t)FFT_LENGTH + (uint16_t)j;
			xn_mid_col_fifo.write(arr0[index]);
		}

		fft1d(2U, xn_mid_col_fifo, xk_mid_col_fifo);

	}

l_transp_out:
	for (size_t i = 0; i < FFT_LENGTH; i++)
	{
		for (size_t j = 0; j < FFT_LENGTH; j++)
		{
#pragma HLS PIPELINE

			uint16_t index = (uint16_t)j * (uint16_t)FFT_LENGTH + (uint16_t)i;
			xk_mid_col_fifo.read(arr1[index]);
		}
	}

l_wr_o_fifo:
	for (size_t i = 0; i < FFT_LENGTH; i++)
	{
		for (size_t j = 0; j < FFT_LENGTH; j++)
		{
#pragma HLS PIPELINE

			uint16_t index = (uint16_t)i * (uint16_t)FFT_LENGTH + (uint16_t)j;
			xk_fifo.write(arr1[index]);
		}
	}

l_wr_xk:
	for (size_t i = 0U; i < FFT_2D_LENGTH; i++) {
#pragma HLS PIPELINE

		AXIS_t m_axis;
		xk_fifo.read(m_axis.data);

		if (i == (FFT_2D_LENGTH - 1)) {
			m_axis.last = 1;
		} else {
			m_axis.last = 0;
		}

		xk[i] = m_axis;
	}
}

