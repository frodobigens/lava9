#!/bin/bash

RPC_URL="https://tm.axelar.lava.build/lava-referer-4a76f825-dd17-4648-a930-72d11364a673/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

axelar_data=$(curl -A UA -x http://216.173.122.149:5876 --proxy-user cwmgurpo:3lv7ii9r7e6p -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"status"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$axelar_data" >> "$OUTPUT_DIR/axelar.txt"
    
    echo "Axelar data fetched and saved to $OUTPUT_DIR/axelar.txt."
else
    echo "Failed to fetch Axelar data."
fi
