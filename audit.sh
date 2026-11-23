#!/bin/bash
# Kali Linux Basic Network & System Security Audit Script
# Author: Diyorbek (rahimberdiyev1910-hub)

echo "=========================================="
echo "   LINUX SYSTEM & NETWORK SECURITY AUDIT  "
echo "=========================================="
echo "[+] Date: $(date)"
echo "[+] Hostname: $(hostname)"
echo "[+] Local IP: $(hostname -I)"
echo ""

echo "[*] Checking Active Network Interfaces..."
ip -brief addr show
echo ""

echo "[*] Checking Open Listening Ports..."
ss -tuln
echo ""

echo "[*] Checking Failed SSH Login Attempts (if log exists)..."
if [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log | tail -n 5
else
    echo "auth.log not found or requires root privileges."
fi
echo ""
echo "[+] Basic Audit Completed."
