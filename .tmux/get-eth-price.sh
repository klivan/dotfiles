#!/bin/bash

curl -s https://api.coinbase.com/v2/prices/ETH-USD/spot | jq -r '.data.amount' | jq '.*100|round/100'
