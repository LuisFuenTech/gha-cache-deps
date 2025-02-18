#!/bin/bash

# Get the node manager from the input
NODE_MANAGER=$1

# Validate the input
if [[ "$NODE_MANAGER" != "npm" && "$NODE_MANAGER" != "yarn" ]]; then
  echo "Error: Invalid node manager. Use 'npm' or 'yarn'."
  exit 1
fi

# Install dependencies
echo "Installing dependencies using $NODE_MANAGER..."
if [[ "$NODE_MANAGER" == "npm" ]]; then
  npm ci
elif [[ "$NODE_MANAGER" == "yarn" ]]; then
  yarn install
fi