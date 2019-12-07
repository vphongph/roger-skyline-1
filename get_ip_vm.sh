#!/bin/bash

netstat -rn | grep "UHLWIi " | cut -d' ' -f1 | head -1