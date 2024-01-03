#!/bin/bash

gcc -c ll.c &&
gcc -c main.c &&
gcc ll.o main.o -o main
