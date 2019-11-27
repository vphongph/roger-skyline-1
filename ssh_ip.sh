#!/bin/bash

ssh `netstat -rn | head -7 | tail -1 | cut -d' ' -f1`
