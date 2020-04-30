/* author : erhan.akagunduz - erhan.akagunduz@gmail.com */

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sstream>
#include "fft2d_top.h"
#include <stdio.h>

#include <fstream>
#include <string>
#include <sstream>

#include <math.h>

using namespace std;

static float sc_xn[1024] = {
	0.75651,0.50378,0.047401,0.47557,0.66846,0.12281,0.51537,0.61347,0.73427,0.097698,0.23929,0.17489,0.9102,0.62526,0.58247,0.061401,0.52936,0.2076,0.1958,0.75663,0.40746,0.0086477,0.32794,0.15572,0.38619,0.60198,0.74487,0.82645,0.95634,0.6437,0.51972,0.10805,
	0.4139,0.48959,0.34237,0.36246,0.20678,0.40732,0.65753,0.81864,0.43028,0.90805,0.57892,0.13865,0.9091,0.54306,0.68664,0.49629,0.82998,0.3181,0.99236,0.99548,0.84449,0.72708,0.80297,0.819,0.6098,0.85717,0.89227,0.57346,0.57297,0.8601,0.059031,0.45988,
	0.49235,0.87705,0.73597,0.78811,0.65385,0.27529,0.95092,0.88624,0.69375,0.10802,0.86689,0.59889,0.59159,0.43904,0.71943,0.64232,0.85876,0.13381,0.80226,0.96243,0.61533,0.35412,0.99948,0.62492,0.16689,0.98828,0.2426,0.79258,0.84972,0.40188,0.89004,0.45088,
	0.69474,0.35314,0.79468,0.7803,0.072052,0.71667,0.72235,0.93111,0.94521,0.517,0.40678,0.90106,0.33257,0.28743,0.65004,0.22127,0.78903,0.67146,0.42423,0.53507,0.37661,0.78045,0.98098,0.73856,0.18809,0.92948,0.1296,0.32904,0.27635,0.63193,0.3302,0.55114,
	0.97273,0.44944,0.54491,0.66851,0.40673,0.28338,0.40008,0.19078,0.78423,0.14316,0.11262,0.93938,0.85306,0.50166,0.72691,0.83706,0.31783,0.57099,0.72886,0.96387,0.87718,0.43666,0.12704,0.80511,0.094629,0.40951,0.22507,0.22346,0.62232,0.98524,0.2297,0.8054,
	0.32775,0.96353,0.68622,0.1335,0.66693,0.8962,0.83187,0.25858,0.70557,0.55937,0.44385,0.22118,0.4424,0.76155,0.37385,0.97108,0.45221,0.16977,0.49835,0.11563,0.78485,0.43655,0.23224,0.067223,0.32319,0.00034146,0.35001,0.31239,0.58836,0.55948,0.11395,0.70085,
	0.8378,0.042298,0.89363,0.021556,0.93373,0.82658,0.13434,0.89787,0.10933,0.0045796,0.30018,0.48267,0.90436,0.76241,0.58158,0.84637,0.75223,0.14766,0.80899,0.051448,0.46495,0.049213,0.023632,0.95079,0.7696,0.54088,0.28708,0.58452,0.96347,0.93359,0.31092,0.87224,
	0.73907,0.97296,0.054792,0.55984,0.81095,0.39003,0.060467,0.59336,0.38993,0.76668,0.40139,0.37601,0.033179,0.57606,0.11612,0.506,0.10986,0.47608,0.35651,0.30435,0.81398,0.049632,0.60743,0.49758,0.23412,0.20773,0.92749,0.82991,0.085903,0.72034,0.22843,0.052192,
	0.95417,0.18921,0.30366,0.30082,0.48455,0.4979,0.084247,0.50384,0.5909,0.84871,0.83336,0.52378,0.53243,0.74766,0.057654,0.27888,0.10974,0.9081,0.073243,0.58019,0.89844,0.0911,0.11081,0.75515,0.74037,0.21928,0.051314,0.29046,0.5005,0.48404,0.652,0.21968,
	0.031923,0.66712,0.046192,0.93941,0.75675,0.69481,0.1639,0.61281,0.45938,0.91682,0.40363,0.26487,0.7165,0.64553,0.97977,0.74662,0.26988,0.55218,0.59099,0.53096,0.42924,0.59404,0.40746,0.74241,0.69282,0.32581,0.59267,0.40255,0.52159,0.63903,0.06616,0.45964,
	0.35687,0.58644,0.19548,0.9809,0.41705,0.83437,0.32422,0.81942,0.05034,0.98697,0.39018,0.068357,0.1793,0.12322,0.28482,0.23693,0.52464,0.03294,0.91019,0.90121,0.33433,0.24108,0.88408,0.83113,0.82408,0.095949,0.1629,0.86206,0.090166,0.88764,0.27543,0.95853,
	0.66265,0.67511,0.72017,0.28662,0.97179,0.60963,0.30173,0.53189,0.22869,0.50513,0.36045,0.43633,0.33653,0.5044,0.59497,0.95735,0.97265,0.053863,0.19377,0.54055,0.59665,0.84137,0.54813,0.1565,0.82798,0.74753,0.83841,0.61474,0.90467,0.19874,0.28182,0.79005,
	0.2815,0.36102,0.72175,0.80082,0.98797,0.57474,0.011681,0.20208,0.83419,0.27142,0.14026,0.17385,0.18771,0.34726,0.96216,0.62026,0.71041,0.80506,0.43237,0.43198,0.90199,0.85721,0.369,0.45731,0.29337,0.74851,0.16756,0.99119,0.88439,0.39537,0.88007,0.45187,
	0.23038,0.62028,0.8778,0.89611,0.86415,0.32604,0.53991,0.45389,0.015645,0.10075,0.26013,0.026107,0.32193,0.092148,0.18578,0.60026,0.31186,0.45137,0.74916,0.54267,0.70207,0.96361,0.20835,0.6181,0.30937,0.5433,0.5022,0.2037,0.43899,0.99218,0.44433,0.33343,
	0.71113,0.81115,0.58243,0.59753,0.38888,0.45642,0.095373,0.42791,0.86371,0.50785,0.086815,0.95468,0.40386,0.14785,0.19304,0.1726,0.29146,0.38265,0.039184,0.71241,0.37746,0.4889,0.44094,0.93218,0.52303,0.33813,0.99933,0.82721,0.78172,0.40235,0.75591,0.059095,
	0.62457,0.019257,0.070684,0.88402,0.45474,0.7138,0.14651,0.96605,0.078069,0.58561,0.4294,0.4306,0.54857,0.19817,0.34164,0.090347,0.85036,0.78964,0.94632,0.016675,0.73496,0.22031,0.9562,0.83509,0.3253,0.83233,0.35541,0.67586,0.14847,0.65886,0.6033,0.74091,
	0.59061,0.083874,0.92274,0.94373,0.24669,0.88441,0.63114,0.62006,0.66904,0.76289,0.25728,0.96156,0.048739,0.67227,0.9329,0.25526,0.91165,0.36429,0.76367,0.80092,0.9541,0.22621,0.12403,0.89542,0.83184,0.55257,0.047078,0.24895,0.61982,0.90135,0.78327,0.50679,
	0.66044,0.9748,0.80037,0.54916,0.78442,0.72086,0.85932,0.69539,0.50021,0.082963,0.29756,0.76241,0.55273,0.43151,0.39067,0.85857,0.63928,0.53235,0.55882,0.14251,0.54281,0.53679,0.47076,0.58252,0.81029,0.95754,0.21366,0.47579,0.26062,0.99538,0.11393,0.19993,
	0.047555,0.65135,0.28595,0.72839,0.88284,0.018613,0.97422,0.72016,0.21799,0.6616,0.42486,0.0073487,0.27481,0.6944,0.27322,0.91107,0.25537,0.71166,0.18384,0.47847,0.54011,0.76211,0.8569,0.58275,0.557,0.89283,0.39784,0.39908,0.44566,0.65316,0.97856,0.42719,
	0.34878,0.23124,0.54366,0.57676,0.91371,0.67478,0.57084,0.3469,0.57162,0.51698,0.11921,0.68004,0.2415,0.25678,0.15195,0.69963,0.088666,0.87148,0.49795,0.25684,0.31111,0.34757,0.04339,0.85493,0.26296,0.3565,0.33367,0.59944,0.844,0.10844,0.8486,0.16869,
	0.45134,0.40349,0.98478,0.025857,0.55828,0.43851,0.99685,0.51699,0.12219,0.17105,0.49507,0.70595,0.24315,0.0097586,0.39711,0.72518,0.83826,0.32869,0.51785,0.36909,0.071235,0.46123,0.69163,0.034866,0.68057,0.5464,0.2296,0.80052,0.1962,0.036114,0.050646,0.75169,
	0.2409,0.12202,0.71568,0.44653,0.59887,0.43782,0.55354,0.55669,0.67117,0.93856,0.70641,0.64513,0.15416,0.53228,0.37472,0.22989,0.58472,0.65012,0.99424,0.66176,0.18198,0.63932,0.97899,0.88542,0.23365,0.34668,0.93612,0.10507,0.30385,0.61809,0.4662,0.36835,
	0.71505,0.26844,0.83897,0.6463,0.14888,0.11704,0.51546,0.1565,0.59959,0.59048,0.24357,0.55231,0.95642,0.27939,0.13111,0.57605,0.94811,0.97484,0.85485,0.16961,0.092989,0.91734,0.28327,0.40773,0.45643,0.6228,0.68319,0.82144,0.48329,0.56714,0.32565,0.94182,
	0.85618,0.25785,0.43326,0.5212,0.89971,0.81468,0.33068,0.56206,0.055976,0.44063,0.78507,0.21811,0.93566,0.94623,0.43504,0.81063,0.061029,0.075967,0.9624,0.27878,0.46349,0.16157,0.13378,0.036382,0.38457,0.79662,0.96211,0.84109,0.33781,0.96196,0.63021,0.017173,
	0.28151,0.33167,0.47062,0.37231,0.45039,0.32486,0.43,0.6948,0.056343,0.94192,0.07409,0.77237,0.81871,0.90644,0.091513,0.40384,0.58464,0.58702,0.67894,0.19822,0.0093325,0.71564,0.68528,0.74615,0.5386,0.74587,0.43797,0.35451,0.79849,0.74611,0.2303,0.82906,
	0.73105,0.15223,0.56071,0.93713,0.20567,0.24623,0.49181,0.42646,0.1525,0.65591,0.39388,0.22803,0.72826,0.39268,0.61463,0.98844,0.28511,0.41389,0.4035,0.19507,0.91503,0.57774,0.90945,0.15483,0.9917,0.12554,0.94034,0.43007,0.98749,0.66252,0.57988,0.62659,
	0.13776,0.34801,0.26909,0.82953,0.89965,0.34271,0.071037,0.83627,0.019621,0.45195,0.0033941,0.37086,0.17581,0.024855,0.010979,0.089999,0.82773,0.30914,0.93498,0.32684,0.64274,0.4333,0.61087,0.14391,0.75522,0.82239,0.0058343,0.57224,0.15905,0.52331,0.60316,0.53875,
	0.83672,0.12166,0.74902,0.84909,0.76259,0.37569,0.88774,0.73139,0.43518,0.8397,0.22068,0.89093,0.36037,0.67144,0.57326,0.32094,0.19099,0.26383,0.47948,0.88034,0.0014191,0.88424,0.89998,0.60596,0.98045,0.025151,0.61031,0.70082,0.23688,0.25989,0.59988,0.65051,
	0.1386,0.88415,0.50389,0.37253,0.88249,0.54655,0.064634,0.36003,0.83222,0.53262,0.0013006,0.85638,0.18879,0.83717,0.78973,0.51141,0.44253,0.75877,0.23179,0.4711,0.030385,0.39305,0.19343,0.25448,0.23478,0.41443,0.80108,0.74247,0.70224,0.96199,0.44843,0.72663,
	0.58821,0.094278,0.64681,0.59318,0.28495,0.56192,0.43618,0.45421,0.61739,0.55389,0.18918,0.40243,0.0011984,0.9715,0.23537,0.060606,0.39341,0.99522,0.39629,0.40397,0.20847,0.17898,0.75442,0.32415,0.52856,0.73141,0.23298,0.75788,0.37547,0.5402,0.035423,0.094489,
	0.36616,0.93004,0.30775,0.87255,0.67323,0.39582,0.82663,0.38639,0.52013,0.68007,0.14248,0.31802,0.31642,0.056933,0.44802,0.72569,0.82657,0.18657,0.70508,0.17923,0.45497,0.63333,0.34626,0.40179,0.051436,0.78137,0.93247,0.38913,0.9737,0.03027,0.51381,0.87757,
	0.80676,0.39902,0.13872,0.9335,0.66428,0.39813,0.39453,0.77555,0.86387,0.36719,0.26808,0.60864,0.69962,0.45032,0.56936,0.55656,0.67687,0.78115,0.55856,0.96892,0.12727,0.624,0.41863,0.40637,0.75688,0.36729,0.76326,0.4293,0.97231,0.69631,0.40773,0.014362
};

static float sc_xk_real[1024U] = {
	524.8,10.9,2.2541,-15.99,-4.4381,-8.253,-8.7033,0.435,11.152,9.2493,6.5296,6.0386,-1.1392,-2.6463,11.674,-2.5287,-13.522,-2.5287,11.674,-2.6463,-1.1392,6.0386,6.5296,9.2493,11.152,0.435,-8.7033,-8.253,-4.4381,-15.99,2.2541,10.9,
	3.848,-4.6661,-3.6873,1.7275,2.2101,5.2304,2.7536,-6.5681,6.6711,0.3684,-3.0772,2.896,7.3584,-6.5268,-8.8985,-0.18459,5.3995,-5.3941,-0.90853,0.30475,-0.90074,-9.0248,18.446,8.1593,1.8257,15.574,-5.2274,16.381,-5.5544,-1.2163,5.2493,-1.9461,
	11.741,-8.9562,0.69831,-3.7955,5.1475,6.9682,-9.4985,-17.466,-0.94703,0.77757,7.2201,-0.50483,10.576,-9.1336,10.789,9.2189,4.5912,-10.251,-2.6858,1.7977,-3.4826,-6.8441,-1.6112,5.842,-1.8804,-1.588,5.3845,-2.1736,-0.45825,-7.916,-5.3052,9.4124,
	2.8849,3.6666,-2.6293,-3.6161,0.57124,-0.49129,3.1457,3.2171,-0.76088,-1.858,12.768,-2.5631,2.1643,-4.4768,-4.941,2.0731,7.2808,-4.7266,0.75451,-2.6117,-4.6436,-7.1723,-3.5969,1.6351,-6.5575,2.2373,5.6168,3.1662,-0.35721,-7.2202,-3.8609,-12.926,
	5.3102,-1.5394,-16.857,0.4196,7.3801,2.9735,-3.5723,-3.5293,12.652,4.4478,17.85,0.82062,-13.316,13.246,3.1342,-9.218,2.0647,-6.6799,2.6199,4.831,8.1598,13.837,10.594,-4.2406,1.8224,8.1307,-10.748,4.5335,-9.8626,2.4119,1.6815,-4.5922,
	-12.921,5.0311,-2.9546,1.938,-13.335,4.8601,-1.9019,3.9992,11.346,-1.5524,-10.68,1.4453,-14.559,5.2273,-4.6292,8.1938,13.751,8.6692,-1.9439,-4.3188,-3.8381,-6.2371,6.4541,1.5152,0.42459,-8.483,6.784,-4.3554,1.8216,-10.795,2.7574,4.8428,
	7.3561,-0.50054,9.7703,-7.5296,0.76518,-0.9498,0.70772,1.3274,-6.0672,-3.3872,-6.7941,-6.8027,13.16,-6.67,11.039,-1.8409,9.549,-17.945,-3.9181,-3.8698,4.6564,0.69367,5.0071,0.66563,12.094,4.4528,-1.3248,8.8199,1.6731,3.1564,-2.8141,-3.2839,
	-5.8607,3.202,8.2571,-2.0769,-5.5042,6.8434,-8.7457,3.5857,4.9807,-1.2138,3.5903,7.9929,4.6653,2.3627,-3.3391,-1.1365,-8.7284,12.472,-13.804,-5.7161,-7.403,8.1822,-4.0199,-2.3358,1.9787,6.5136,-4.0258,3.6463,-11.835,2.6385,-8.8592,1.5561,
	-3.3741,-4.5118,0.46436,0.734,-2.8387,-1.9438,-7.2237,-3.4019,-1.7303,2.8979,1.6714,3.3537,11.697,2.4279,0.66297,10.516,-0.78153,5.4383,-3.5827,-0.27658,-1.0935,0.66978,-8.6727,-2.0853,13.87,10.134,-1.5317,7.8903,-6.4088,2.1531,7.6222,-8.3514,
	-5.6763,4.9378,-3.2583,12.107,0.21346,-1.2547,11.441,4.8611,-1.9086,7.048,7.6945,3.4587,-0.80521,-5.7456,-6.9838,3.75,-5.4034,4.8382,-7.289,10.442,6.5686,2.5676,8.2474,-7.641,7.1498,-6.4662,-6.5488,0.14222,7.6651,0.40577,-5.3931,-2.8239,
	-11.146,3.9681,-1.2545,-9.0811,-10.105,0.19693,-7.5639,-9.7115,4.1945,-3.6548,-0.7663,-0.58539,7.1723,11.235,14.236,-7.9386,-2.8829,-6.6693,-1.4427,5.8519,3.6359,10.751,-2.0937,7.7048,1.1057,8.3371,-8.013,-2.243,3.7318,-5.9219,12.094,2.2677,
	-6.7234,4.9063,-11.94,-2.102,6.5847,7.1859,3.5694,8.6111,3.8836,7.0371,2.5901,-12.309,1.0735,10.665,6.2084,-3.333,3.6054,-2.3781,6.4018,8.4114,0.064068,-11.647,-2.8134,2.6422,1.0221,-13.381,1.4275,-1.0017,-4.3322,-8.8212,0.30847,-6.6242,
	-5.73,2.8283,1.9981,-1.5961,2.8027,-6.24,-6.1944,-1.5009,3.1042,-4.6188,10.895,4.4406,7.5735,-2.3594,-2.1347,11.599,1.0313,8.6336,11.44,-6.4328,-0.22131,-12.4,-4.7516,-7.7691,-4.6793,0.77163,-1.278,2.675,1.6906,13.137,-16.379,2.173,
	-7.6187,6.3806,-0.62057,3.6438,10.129,2.218,19.088,-4.9516,-5.5909,2.2975,3.1279,-4.0851,8.8368,9.6078,-4.8739,-6.4569,3.3119,-3.5025,-6.3547,1.3681,-5.0157,5.504,-5.3356,-7.3422,-1.2778,4.8289,2.6265,0.029338,-1.4012,0.72406,0.32038,5.8415,
	3.2355,1.9086,-1.3934,5.0196,-10.619,2.1801,1.6442,7.0301,-12.963,-10.419,-6.8324,4.3178,-3.7558,-10.818,-9.9039,1.1856,11.493,8.3958,-6.6396,2.5553,1.5533,-3.6575,9.1632,5.428,0.48135,0.5118,-4.7638,8.2947,-3.9025,-8.0995,2.0792,9.2825,
	-4.0114,5.774,4.1744,-7.4729,-7.097,-3.7955,4.3395,1.0105,-5.2615,3.7961,4.2233,-5.2713,-13.301,-0.15217,5.462,-3.9537,3.8548,-5.1788,-1.7369,-3.4803,-10.535,2.1415,-3.8679,7.0757,10.324,-4.9716,1.0809,7.236,-2.9461,-2.1303,10.336,5.0013,
	-3.2578,6.6952,10.898,2.0347,2.3933,-0.66235,-4.1977,-4.586,9.1735,-5.4833,-7.3035,-11.328,-3.0012,-7.481,6.6015,-2.5958,-1.5341,-2.5958,6.6015,-7.481,-3.0012,-11.328,-7.3035,-5.4833,9.1735,-4.586,-4.1977,-0.66235,2.3933,2.0347,10.898,6.6952,
	-4.0114,5.0013,10.336,-2.1303,-2.9461,7.236,1.0809,-4.9716,10.324,7.0757,-3.8679,2.1415,-10.535,-3.4803,-1.7369,-5.1788,3.8548,-3.9537,5.462,-0.15217,-13.301,-5.2713,4.2233,3.7961,-5.2615,1.0105,4.3395,-3.7955,-7.097,-7.4729,4.1744,5.774,
	3.2355,9.2825,2.0792,-8.0995,-3.9025,8.2947,-4.7638,0.5118,0.48135,5.428,9.1632,-3.6575,1.5533,2.5553,-6.6396,8.3958,11.493,1.1856,-9.9039,-10.818,-3.7558,4.3178,-6.8324,-10.419,-12.963,7.0301,1.6442,2.1801,-10.619,5.0196,-1.3934,1.9086,
	-7.6187,5.8415,0.32038,0.72406,-1.4012,0.029338,2.6265,4.8289,-1.2778,-7.3422,-5.3356,5.504,-5.0157,1.3681,-6.3547,-3.5025,3.3119,-6.4569,-4.8739,9.6078,8.8368,-4.0851,3.1279,2.2975,-5.5909,-4.9516,19.088,2.218,10.129,3.6438,-0.62057,6.3806,
	-5.73,2.173,-16.379,13.137,1.6906,2.675,-1.278,0.77163,-4.6793,-7.7691,-4.7516,-12.4,-0.22131,-6.4328,11.44,8.6336,1.0313,11.599,-2.1347,-2.3594,7.5735,4.4406,10.895,-4.6188,3.1042,-1.5009,-6.1944,-6.24,2.8027,-1.5961,1.9981,2.8283,
	-6.7234,-6.6242,0.30847,-8.8212,-4.3322,-1.0017,1.4275,-13.381,1.0221,2.6422,-2.8134,-11.647,0.064068,8.4114,6.4018,-2.3781,3.6054,-3.333,6.2084,10.665,1.0735,-12.309,2.5901,7.0371,3.8836,8.6111,3.5694,7.1859,6.5847,-2.102,-11.94,4.9063,
	-11.146,2.2677,12.094,-5.9219,3.7318,-2.243,-8.013,8.3371,1.1057,7.7048,-2.0937,10.751,3.6359,5.8519,-1.4427,-6.6693,-2.8829,-7.9386,14.236,11.235,7.1723,-0.58539,-0.7663,-3.6548,4.1945,-9.7115,-7.5639,0.19693,-10.105,-9.0811,-1.2545,3.9681,
	-5.6763,-2.8239,-5.3931,0.40577,7.6651,0.14222,-6.5488,-6.4662,7.1498,-7.641,8.2474,2.5676,6.5686,10.442,-7.289,4.8382,-5.4034,3.75,-6.9838,-5.7456,-0.80521,3.4587,7.6945,7.048,-1.9086,4.8611,11.441,-1.2547,0.21346,12.107,-3.2583,4.9378,
	-3.3741,-8.3514,7.6222,2.1531,-6.4088,7.8903,-1.5317,10.134,13.87,-2.0853,-8.6727,0.66978,-1.0935,-0.27658,-3.5827,5.4383,-0.78153,10.516,0.66297,2.4279,11.697,3.3537,1.6714,2.8979,-1.7303,-3.4019,-7.2237,-1.9438,-2.8387,0.734,0.46436,-4.5118,
	-5.8607,1.5561,-8.8592,2.6385,-11.835,3.6463,-4.0258,6.5136,1.9787,-2.3358,-4.0199,8.1822,-7.403,-5.7161,-13.804,12.472,-8.7284,-1.1365,-3.3391,2.3627,4.6653,7.9929,3.5903,-1.2138,4.9807,3.5857,-8.7457,6.8434,-5.5042,-2.0769,8.2571,3.202,
	7.3561,-3.2839,-2.8141,3.1564,1.6731,8.8199,-1.3248,4.4528,12.094,0.66563,5.0071,0.69367,4.6564,-3.8698,-3.9181,-17.945,9.549,-1.8409,11.039,-6.67,13.16,-6.8027,-6.7941,-3.3872,-6.0672,1.3274,0.70772,-0.9498,0.76518,-7.5296,9.7703,-0.50054,
	-12.921,4.8428,2.7574,-10.795,1.8216,-4.3554,6.784,-8.483,0.42459,1.5152,6.4541,-6.2371,-3.8381,-4.3188,-1.9439,8.6692,13.751,8.1938,-4.6292,5.2273,-14.559,1.4453,-10.68,-1.5524,11.346,3.9992,-1.9019,4.8601,-13.335,1.938,-2.9546,5.0311,
	5.3102,-4.5922,1.6815,2.4119,-9.8626,4.5335,-10.748,8.1307,1.8224,-4.2406,10.594,13.837,8.1598,4.831,2.6199,-6.6799,2.0647,-9.218,3.1342,13.246,-13.316,0.82062,17.85,4.4478,12.652,-3.5293,-3.5723,2.9735,7.3801,0.4196,-16.857,-1.5394,
	2.8849,-12.926,-3.8609,-7.2202,-0.35721,3.1662,5.6168,2.2373,-6.5575,1.6351,-3.5969,-7.1723,-4.6436,-2.6117,0.75451,-4.7266,7.2808,2.0731,-4.941,-4.4768,2.1643,-2.5631,12.768,-1.858,-0.76088,3.2171,3.1457,-0.49129,0.57124,-3.6161,-2.6293,3.6666,
	11.741,9.4124,-5.3052,-7.916,-0.45825,-2.1736,5.3845,-1.588,-1.8804,5.842,-1.6112,-6.8441,-3.4826,1.7977,-2.6858,-10.251,4.5912,9.2189,10.789,-9.1336,10.576,-0.50483,7.2201,0.77757,-0.94703,-17.466,-9.4985,6.9682,5.1475,-3.7955,0.69831,-8.9562,
	3.848,-1.9461,5.2493,-1.2163,-5.5544,16.381,-5.2274,15.574,1.8257,8.1593,18.446,-9.0248,-0.90074,0.30475,-0.90853,-5.3941,5.3995,-0.18459,-8.8985,-6.5268,7.3584,2.896,-3.0772,0.3684,6.6711,-6.5681,2.7536,5.2304,2.2101,1.7275,-3.6873,-4.6661
};
static const float sc_xk_imag[1024U] = {
	0,8.4769,-8.242,-2.3696,-1.0436,-1.8436,-5.0024,6.1871,6.2608,-5.285,5.6021,-3.9178,2.9795,4.315,12.47,-6.5982,0,6.5982,-12.47,-4.315,-2.9795,3.9178,-5.6021,5.285,-6.2608,-6.1871,5.0024,1.8436,1.0436,2.3696,8.242,-8.4769,
	-3.2969,-4.297,4.565,-1.2796,1.4047,-8.4121,-1.2213,-5.8579,-9.8104,-0.31497,3.3138,3.7757,1.4017,-4.9339,-3.8411,8.8336,3.638,7.0957,3.191,-5.63,6.6695,-2.4983,-4.337,8.5725,-11.792,-11.108,8.7307,5.632,2.0696,-8.3221,-11.827,4.3771,
	-5.0923,8.9893,-7.495,-0.16457,-3.1787,-8.0589,-10.6,-0.79853,7.304,-3.1049,-4.2456,6.057,-9.1571,-13.549,-5.6667,7.0788,-6.4294,-12.166,6.2564,5.5072,18.203,-11.301,0.12504,4.0675,2.2946,7.2976,0.85859,-1.1126,-4.7229,-6.1879,5.2018,4.9242,
	-13.57,6.2476,-2.5494,-3.9786,-1.9346,-8.0466,2.2749,14.277,2.1265,-5.1496,4.3013,-7.9939,-2.4704,0.39034,-19.14,14.694,-7.5819,1.4863,2.8276,-4.1259,0.56189,5.1812,-8.71,-0.055908,2.4563,5.6193,-2.0167,3.786,12.857,-8.4057,-5.6889,-3.5161,
	-10.615,5.6712,14.964,-2.6206,-1.7918,8.5799,2.3973,0.12005,1.4844,-1.3193,-6.116,-0.7133,2.3736,-0.54675,-2.859,-5.1065,4.4279,14.781,6.7614,0.18881,-0.086808,15.503,3.7347,-2.2281,7.0232,3.7828,7.2559,-4.2177,-0.38883,-5.4061,-4.0989,0.88572,
	1.8959,11.195,9.1272,-9.331,-2.8121,-1.8632,3.0793,-5.0176,11.222,2.5974,-8.1971,-8.7172,-7.1503,-1.335,-7.2518,-0.45204,1.6741,2.2332,-3.23,-3.3611,-7.9123,11.056,1.9775,4.7211,5.2147,-1.4686,-0.9952,6.126,-4.8349,-7.7424,10.781,-3.6294,
	-9.4948,-2.8574,-2.1865,5.8011,6.6357,-1.3883,4.6917,-0.56221,5.4372,0.72742,3.6559,4.3411,8.1383,5.6764,3.1247,-7.4198,0.72642,-2.4265,-3.9883,-13.347,-4.906,6.9573,-4.5975,0.37193,-4.1744,3.6588,-0.096388,-6.8881,1.2047,5.0242,-2.3747,-1.8172,
	2.1358,-4.3359,10.298,4.6163,0.21378,-2.0088,-7.4,-6.8647,0.052883,-0.46861,-4.6915,-0.61816,5.4732,2.4943,-9.3173,11,1.3704,1.0934,3.011,-3.5251,2.3625,15.165,3.1125,12.912,6.0543,-11.917,-2.1812,-4.5274,-0.37023,5.4218,-3.5839,1.396,
	0.58389,-0.47209,5.5641,0.45231,1.1316,1.1133,5.1026,-0.88811,-2.2084,5.4137,-5.4079,9.9023,3.0725,6.5217,10.199,8.3339,-1.3827,3.6916,6.953,1.4828,5.6309,-15.434,3.721,0.31758,7.8547,4.6267,5.0491,2.3243,-0.32033,-1.3033,-8.4566,11.868,
	6.9574,12.008,3.2175,2.8144,-2.1878,-5.0349,-4.7954,7.3672,-9.0624,0.2592,-4.8981,1.6075,1.8889,-3.3985,-1.3354,-3.5848,-5.3617,3.0544,-0.28296,-12.182,11.07,-8.2043,6.6917,9.5327,-2.9777,-6.9725,3.9423,3.8124,3.1169,-2.1383,-9.2257,-2.8815,
	10.028,-1.7711,1.8841,-3.1868,-3.0689,-5.2806,-7.1231,-1.3726,2.8257,4.3842,-6.3948,2.4478,-2.9802,0.25145,0.51339,5.254,2.1068,1.6816,-3.639,-0.43887,-4.9897,-5.014,-3.0265,-2.2273,0.099156,-1.3259,-2.8715,-13.93,1.0065,-5.3227,4.7691,-6.3246,
	-4.7599,4.4379,7.0034,-10.032,1.6422,8.2119,4.2377,-0.49073,4.2885,0.12749,-10.08,-5.8885,4.7194,7.9092,-1.1599,9.4556,10.329,4.3922,-10.191,4.1322,7.4821,-5.155,-5.5083,-1.4713,13.349,-6.4422,7.1987,1.1984,-3.5764,4.3461,1.916,7.2894,
	-10.389,-4.7384,-4.4587,2.4988,-1.82,1.6809,-11.574,1.529,-9.4752,8.6053,12.981,-3.1968,-0.52973,6.9281,-1.984,-8.9923,-4.7364,-5.1582,-2.3018,10.492,0.31443,-10.996,7.6492,-5.5155,-6.0563,2.5585,-2.5256,-7.7718,-5.7746,-5.0166,2.8278,4.648,
	0.16215,-4.1708,-5.2915,-0.75614,-1.3395,-6.5404,-6.6136,8.4779,7.3548,5.7459,-0.9503,-4.8439,-2.267,-3.2927,4.8348,7.9127,-6.3188,3.5753,-2.6591,-2.1188,12.47,5.1777,-8.8037,-4.2825,3.496,-0.40667,-0.011066,1.3577,-2.4182,-0.2854,2.3775,-0.083482,
	5.3152,-7.4213,8.832,-0.35865,0.77364,-9.2517,12.371,-7.8454,2.6518,0.06148,0.43728,-2.4739,-5.0224,-2.3416,-5.6768,0.63689,6.4336,8.2356,2.3992,8.8724,7.3395,2.4423,10.134,9.8391,-0.85677,-0.76248,-9.3241,18.865,-0.14028,5.3288,-0.21453,-0.32196,
	6.7825,0.3496,1.4118,0.86319,-6.8186,4.9981,-7.6531,8.4512,1.7242,-8.4216,-0.96111,3.097,11.408,5.7589,5.814,12.604,10.095,5.632,3.166,18.569,1.6204,7.7466,5.0326,5.3174,-1.1187,8.3283,-10.96,-4.4516,-4.9575,6.6728,-4.2195,1.2801,
	0,4.7624,8.7776,5.6876,0.38379,4.8986,-1.9736,-1.3256,10.233,3.0209,2.3439,4.5939,-8.5701,-4.1651,0.94102,8.6242,0,-8.6242,-0.94102,4.1651,8.5701,-4.5939,-2.3439,-3.0209,-10.233,1.3256,1.9736,-4.8986,-0.38379,-5.6876,-8.7776,-4.7624,
	-6.7825,-1.2801,4.2195,-6.6728,4.9575,4.4516,10.96,-8.3283,1.1187,-5.3174,-5.0326,-7.7466,-1.6204,-18.569,-3.166,-5.632,-10.095,-12.604,-5.814,-5.7589,-11.408,-3.097,0.96111,8.4216,-1.7242,-8.4512,7.6531,-4.9981,6.8186,-0.86319,-1.4118,-0.3496,
	-5.3152,0.32196,0.21453,-5.3288,0.14028,-18.865,9.3241,0.76248,0.85677,-9.8391,-10.134,-2.4423,-7.3395,-8.8724,-2.3992,-8.2356,-6.4336,-0.63689,5.6768,2.3416,5.0224,2.4739,-0.43728,-0.06148,-2.6518,7.8454,-12.371,9.2517,-0.77364,0.35865,-8.832,7.4213,
	-0.16215,0.083482,-2.3775,0.2854,2.4182,-1.3577,0.011066,0.40667,-3.496,4.2825,8.8037,-5.1777,-12.47,2.1188,2.6591,-3.5753,6.3188,-7.9127,-4.8348,3.2927,2.267,4.8439,0.9503,-5.7459,-7.3548,-8.4779,6.6136,6.5404,1.3395,0.75614,5.2915,4.1708,
	10.389,-4.648,-2.8278,5.0166,5.7746,7.7718,2.5256,-2.5585,6.0563,5.5155,-7.6492,10.996,-0.31443,-10.492,2.3018,5.1582,4.7364,8.9923,1.984,-6.9281,0.52973,3.1968,-12.981,-8.6053,9.4752,-1.529,11.574,-1.6809,1.82,-2.4988,4.4587,4.7384,
	4.7599,-7.2894,-1.916,-4.3461,3.5764,-1.1984,-7.1987,6.4422,-13.349,1.4713,5.5083,5.155,-7.4821,-4.1322,10.191,-4.3922,-10.329,-9.4556,1.1599,-7.9092,-4.7194,5.8885,10.08,-0.12749,-4.2885,0.49073,-4.2377,-8.2119,-1.6422,10.032,-7.0034,-4.4379,
	-10.028,6.3246,-4.7691,5.3227,-1.0065,13.93,2.8715,1.3259,-0.099156,2.2273,3.0265,5.014,4.9897,0.43887,3.639,-1.6816,-2.1068,-5.254,-0.51339,-0.25145,2.9802,-2.4478,6.3948,-4.3842,-2.8257,1.3726,7.1231,5.2806,3.0689,3.1868,-1.8841,1.7711,
	-6.9574,2.8815,9.2257,2.1383,-3.1169,-3.8124,-3.9423,6.9725,2.9777,-9.5327,-6.6917,8.2043,-11.07,12.182,0.28296,-3.0544,5.3617,3.5848,1.3354,3.3985,-1.8889,-1.6075,4.8981,-0.2592,9.0624,-7.3672,4.7954,5.0349,2.1878,-2.8144,-3.2175,-12.008,
	-0.58389,-11.868,8.4566,1.3033,0.32033,-2.3243,-5.0491,-4.6267,-7.8547,-0.31758,-3.721,15.434,-5.6309,-1.4828,-6.953,-3.6916,1.3827,-8.3339,-10.199,-6.5217,-3.0725,-9.9023,5.4079,-5.4137,2.2084,0.88811,-5.1026,-1.1133,-1.1316,-0.45231,-5.5641,0.47209,
	-2.1358,-1.396,3.5839,-5.4218,0.37023,4.5274,2.1812,11.917,-6.0543,-12.912,-3.1125,-15.165,-2.3625,3.5251,-3.011,-1.0934,-1.3704,-11,9.3173,-2.4943,-5.4732,0.61816,4.6915,0.46861,-0.052883,6.8647,7.4,2.0088,-0.21378,-4.6163,-10.298,4.3359,
	9.4948,1.8172,2.3747,-5.0242,-1.2047,6.8881,0.096388,-3.6588,4.1744,-0.37193,4.5975,-6.9573,4.906,13.347,3.9883,2.4265,-0.72642,7.4198,-3.1247,-5.6764,-8.1383,-4.3411,-3.6559,-0.72742,-5.4372,0.56221,-4.6917,1.3883,-6.6357,-5.8011,2.1865,2.8574,
	-1.8959,3.6294,-10.781,7.7424,4.8349,-6.126,0.9952,1.4686,-5.2147,-4.7211,-1.9775,-11.056,7.9123,3.3611,3.23,-2.2332,-1.6741,0.45204,7.2518,1.335,7.1503,8.7172,8.1971,-2.5974,-11.222,5.0176,-3.0793,1.8632,2.8121,9.331,-9.1272,-11.195,
	10.615,-0.88572,4.0989,5.4061,0.38883,4.2177,-7.2559,-3.7828,-7.0232,2.2281,-3.7347,-15.503,0.086808,-0.18881,-6.7614,-14.781,-4.4279,5.1065,2.859,0.54675,-2.3736,0.7133,6.116,1.3193,-1.4844,-0.12005,-2.3973,-8.5799,1.7918,2.6206,-14.964,-5.6712,
	13.57,3.5161,5.6889,8.4057,-12.857,-3.786,2.0167,-5.6193,-2.4563,0.055908,8.71,-5.1812,-0.56189,4.1259,-2.8276,-1.4863,7.5819,-14.694,19.14,-0.39034,2.4704,7.9939,-4.3013,5.1496,-2.1265,-14.277,-2.2749,8.0466,1.9346,3.9786,2.5494,-6.2476,
	5.0923,-4.9242,-5.2018,6.1879,4.7229,1.1126,-0.85859,-7.2976,-2.2946,-4.0675,-0.12504,11.301,-18.203,-5.5072,-6.2564,12.166,6.4294,-7.0788,5.6667,13.549,9.1571,-6.057,4.2456,3.1049,-7.304,0.79853,10.6,8.0589,3.1787,0.16457,7.495,-8.9893,
	3.2969,-4.3771,11.827,8.3221,-2.0696,-5.632,-8.7307,11.108,11.792,-8.5725,4.337,2.4983,-6.6695,5.63,-3.191,-7.0957,-3.638,-8.8336,3.8411,4.9339,-1.4017,-3.7757,-3.3138,0.31497,9.8104,5.8579,1.2213,8.4121,-1.4047,1.2796,-4.565,4.297
};

int main()
{
	AXIS_t xn[FFT_2D_LENGTH];
	AXIS_t xk[FFT_2D_LENGTH];

	for (size_t i = 0; i < FFT_2D_LENGTH; i++)
	{
		xn[i].data.real = sc_xn[i];
		xn[i].data.imag = 0.0f;
	}

	fft2d_top(xn, xk);

	unsigned int error_counter_real = 0U;
	unsigned int error_counter_imag = 0U;
	for (size_t i = 0; i < FFT_2D_LENGTH; i++)
	{
		if (fabs(xk[i].data.real - sc_xk_real[i]) > 0.001f)
		{
			error_counter_real++;
			printf("r_%d:(%.4f, %4f)\n", i, xk[i].data.real, sc_xk_real[i]);
		}

		if (fabs(xk[i].data.imag - sc_xk_imag[i]) > 0.001f)
		{
			error_counter_imag++;
			printf("i_%d:(%.4f, %4f)\n", i, xk[i].data.imag, sc_xk_imag[i]);
		}
	}

	if ((error_counter_real == 0) && (error_counter_imag == 0))
	{
		printf("Success!\n");
	}
	else
	{
		printf("Fail\n");
	}

	fft2d_top(xn, xk);
	fft2d_top(xn, xk);
	fft2d_top(xn, xk);

	return 0;
}

