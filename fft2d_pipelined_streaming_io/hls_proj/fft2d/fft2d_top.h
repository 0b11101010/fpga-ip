/* author : erhan.akagunduz - erhan.akagunduz@gmail.com */

#include "hls_fft.h"

// configurable params
const char	FFT_INPUT_WIDTH                     = 32;
const char	FFT_OUTPUT_WIDTH                    = FFT_INPUT_WIDTH;
const char	FFT_CONFIG_WIDTH                    = 8;
const char	FFT_NFFT_MAX                        = 5;
const int	FFT_LENGTH                          = 1 << FFT_NFFT_MAX;
const int	FFT_2D_LENGTH						= FFT_LENGTH * FFT_LENGTH;

#include <stdint.h>

struct configuration : hls::ip_fft::params_t {
    static const unsigned input_width = FFT_INPUT_WIDTH;
    static const unsigned output_width = FFT_OUTPUT_WIDTH;
    static const unsigned status_width = 8;
    static const unsigned config_width = FFT_CONFIG_WIDTH;
    static const unsigned max_nfft = FFT_NFFT_MAX;

    static const bool has_nfft = false;
    static const unsigned  channels = 1;
    static const unsigned arch_opt = hls::ip_fft::pipelined_streaming_io;
    static const unsigned phase_factor_width = 24;
    static const unsigned ordering_opt = hls::ip_fft::natural_order;
    static const bool ovflo = false;
    static const unsigned scaling_opt = hls::ip_fft::scaled;
    static const unsigned rounding_opt = hls::ip_fft::truncation;
    static const unsigned mem_data = hls::ip_fft::block_ram;
    static const unsigned mem_phase_factors = hls::ip_fft::block_ram;
    static const unsigned mem_reorder = hls::ip_fft::block_ram;
    static const unsigned stages_block_ram = (max_nfft < 10) ? 0 : (max_nfft - 9);
    static const bool mem_hybrid = false;
    static const unsigned complex_mult_type = hls::ip_fft::use_mults_performance;
    static const unsigned butterfly_type = hls::ip_fft::use_luts;

    //not supported params:
    static const bool xk_index = false;
    static const bool cyclic_prefix_insertion = false;
};

typedef hls::ip_fft::config_t<struct configuration> config_t;
typedef hls::ip_fft::status_t<struct configuration> status_t;

typedef float data_t;

typedef struct {
	data_t real;
	data_t imag;
}DATA_t;

typedef struct {
	DATA_t data;
	bool last;
}AXIS_t;

//typedef struct {
//	uint8_t direction;
//}AXIS_CONFIG_t;


void fft2d_top(
	AXIS_t xn[FFT_2D_LENGTH],
	AXIS_t xk[FFT_2D_LENGTH]
);

