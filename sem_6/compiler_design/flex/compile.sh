#!/bin/sh

flex "$1" && gcc lex.yy.c -o "$(basename "$1" .lex)" -lfl
