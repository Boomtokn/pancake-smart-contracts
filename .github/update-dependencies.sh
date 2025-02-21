#!/bin/bash

echo "🔄 Updating dependencies..."

# Step 1: Upgrade dependencies to their latest compatible versions
yarn upgrade

# Step 2: Upgrade to latest versions (including major updates) if specified
if [[ "$1" == "--latest" ]]; then
  echo "⚠️  Upgrading to latest versions (including breaking changes)..."
  yarn upgrade --latest
fi

# Step 3: Reinstall dependencies if needed
echo "🛠️  Checking for issues..."
if [[ $? -ne 0 ]]; then
  echo "❌ Update failed. Reinstalling dependencies..."
  rm -rf node_modules yarn.lock
  yarn install
fi

echo "✅ Dependencies updated successfully!"
