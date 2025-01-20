#!/bin/sh
make && ./main "$1" && cat sanitized && cat no_pre
