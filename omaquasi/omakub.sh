#!/bin/bash

REPO_URL="git@github.com:basecamp/omakub.git"
LOCAL_PATH="$HOME/.local/share/omakub"
VERSION=v1.1.4
CURRENT_DIR=$(pwd)

# Check if the directory exists
if [ -d "$LOCAL_PATH/.git" ]; then
  echo "Updating existing repository..."
  cd "$LOCAL_PATH" || exit

  # Check if the current version matches the desired version
  CURRENT_VERSION=$(git describe --tags)
  if [ "$CURRENT_VERSION" = "$VERSION" ]; then
    echo "Already at version $VERSION."
  else
    echo "Checking out version $VERSION..."
    git fetch --tags origin
    git pull origin master
    git checkout "$VERSION" -q
  fi

else
  echo "Cloning repository..."
  git clone "$REPO_URL" "$LOCAL_PATH"
  cd "$LOCAL_PATH" || exit

  echo "Checking out version $VERSION..."
  git checkout "$VERSION"
fi
cd "$CURRENT_DIR" || exit