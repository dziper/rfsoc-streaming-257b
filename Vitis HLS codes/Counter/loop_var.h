/*
 * Copyright 2021 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _LOOP_VAR_H_
#define _LOOP_VAR_H_

#include <iostream>
#include <fstream>
using namespace std;

#include <hls_stream.h>

#include "ap_int.h"
#define N 512

typedef ap_int<8>  din_t;
typedef ap_int<13> dout_t;
typedef ap_uint<5> dsel_t;

void loop_var(hls::stream<ap_uint<8>> &out_stream);

#endif

