#!/bin/bash

INTERFACE="wlx7cc2c638e610"  # Replace with your network interface name

RX_PREV=$(ifconfig $INTERFACE | awk '/RX packets/{print $5}')
TX_PREV=$(ifconfig $INTERFACE | awk '/TX packets/{print $5}')

sleep 1  # Wait for a second

RX_CUR=$(ifconfig $INTERFACE | awk '/RX packets/{print $5}')
TX_CUR=$(ifconfig $INTERFACE | awk '/TX packets/{print $5}')

RX_DIFF=$((RX_CUR - RX_PREV))
TX_DIFF=$((TX_CUR - TX_PREV))

RX_Mbps=$(echo "scale=2; $RX_DIFF * 8 / 1024 / 1024" | bc)
TX_Mbps=$(echo "scale=2; $TX_DIFF * 8 / 1024 / 1024" | bc)

echo "↓ ${RX_Mbps} Mbps ↑${TX_Mbps} Mbps"
