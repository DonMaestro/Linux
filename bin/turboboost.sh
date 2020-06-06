#!/bin/bash

echo $1 > /sys/devices/system/cpu/cpufreq/boost
cat /sys/devices/system/cpu/cpufreq/boost

