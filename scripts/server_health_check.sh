#!/bin/bash

echo "===== Server Health Check ====="

echo "Hostname:"
hostname

echo

echo "Uptime:"
uptime

echo

echo "Memory Usage:"
free -h

echo

echo "Disk Usage:"
df -h

echo

echo "Running Apache Status:"
systemctl status apache2 --no-pager