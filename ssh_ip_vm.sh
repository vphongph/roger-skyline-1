#!/bin/bash

ssh `netstat -rn | grep "UHLWIi " | cut -d' ' -f1 | head -1`
