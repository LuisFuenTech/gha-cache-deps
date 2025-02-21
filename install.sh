#!/bin/bash

NODE_MANAGER="$1"
LOCK_FILE="$2"

# Validate the node manager
case "$NODE_MANAGER" in
  npm)
    EXPECTED_LOCK_FILE="package-lock.json"
    INSTALL_COMMAND="npm ci"
    ;;
  yarn)
    EXPECTED_LOCK_FILE="yarn.lock"
    INSTALL_COMMAND="yarn install --frozen-lockfile"
    ;;
  pnpm)
    EXPECTED_LOCK_FILE="pnpm-lock.yaml"
    INSTALL_COMMAND="pnpm install --frozen-lockfile"
    ;;
  *)
    echo "Error: Invalid node manager. Use 'npm', 'yarn', or 'pnpm'."
    exit 1
    ;;
esac

# Validate the lock file
if [[ "$LOCK_FILE" != "$EXPECTED_LOCK_FILE" ]]; then
  echo "Error: Invalid lock file for '$NODE_MANAGER'. Expected '$EXPECTED_LOCK_FILE', got '$LOCK_FILE'"
  exit 1
fi

# Execute the installation command
echo "Node manager: $NODE_MANAGER"
echo "Lock file: $LOCK_FILE"
echo "Running installation command: $INSTALL_COMMAND"
eval "$INSTALL_COMMAND"