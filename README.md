# Cache/Install NodeJS Dependencies

This GitHub Action caches NodeJS dependencies or installs them if the cache is not available.

## Inputs

### `caching`

**Optional**  
**Default**: `true`  
Whether to cache dependencies or not.

### `node-manager`

**Optional**  
**Default**: `npm`  
The node manager to use (`npm`, `yarn`, or `pnpm`).

### `lock-file`

**Optional**  
**Default**: `package-lock.json`  
The lock file to use.

## Outputs

### `used-cache`

Whether the cache was used or not.

## Example usage

```yaml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Check Repository
        uses: actions/checkout@v4

      - name: Cache/Install NodeJS Dependencies
        uses: LuisFuenTech/gha-cache-deps@v1.2.0
        with:
          node-manager: yarn
          lock-file: yarn.lock
```

## Using pnpm

If you're using pnpm as node package manager, you must install it before using this action.

### Example

```yaml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Check Repository
        uses: actions/checkout@v4

      - name: Install pnpm # Install pnpm before using the action
        uses: pnpm/action-setup@v4
        with:
          version: 10

      - name: Cache/Install NodeJS Dependencies
        uses: LuisFuenTech/gha-cache-deps@v1.2.0
        with:
          node-manager: pnpm
          lock-file: pnpm-lock.yaml
```
