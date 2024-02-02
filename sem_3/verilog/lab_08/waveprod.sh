#!/bin/bash

iverilog -o $(basename $1 .v).vvp $(basename $1 .v)_tb.v
vvp $(basename $1 .v).vvp 
gtkwave $(basename $1 .v)_tb.vcd
