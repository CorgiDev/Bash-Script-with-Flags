#!/bin/bash

mac_flag=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -m|--macos)
        mac_flag="true"
        ;;
    *)
      echo "Usage: $0 [-m|--macos]"
      exit 1
      ;;
  esac
  shift
done

# Example usage
if [ "$mac_flag" = "true" ]; then
  echo "Ensuring your Mac works with the date script."
  brew install coreutils -g > /dev/null && echo "alias date=gdate" >> ~/.bash_profile
  echo "Mac setup complete. Moving on to main setup."
fi

echo "Installing and updating required applications and packages."
echo "Checking for Nodejs" && node -v && node_version=$(node -v) && echo "Nodejs confirmed. Node $node_version installed." || echo "Nodejs not found. Current Nodejs / NPM installer available at https://nodejs.org/en/download/."
echo "Checking for NPM" && npm -v && echo "NPM confirmed installed. Checking for updates." && npm update -g > /dev/null && npm_version=$(npm -v) && echo "NPM version $npm_version installed and confirmed up to date."|| echo "NPM failed to update. Current Nodejs / NPM installer available at https://nodejs.org/en/download/."
echo "Checking for Homebrew" && brew -v > /dev/null && echo "Brew already installed. Checking for updates." && brew update && brew_version=$(brew -v) && echo "Brew $brew_version confirmed installed and up to date." || echo "Homebrew not found. Information on Homebrew installs available at https://brew.sh/."

echo "Attempting to install nodejs-polars module." && npm list nodejs-polars > /dev/null || npm i nodejs-polars > /dev/null && echo "nodejs-polars installed successfully." || echo "nodejs-polars failed to install. Please try again."
echo "Attempting to install the csvtojson module." && npm list csvtojson > /dev/null || npm i csvtojson > /dev/null && echo "csvtojson installed successfully." || echo "csvtojson failed to install. Please try again."
echo "Attempting to install the GitHub CLI" && npm list gh > /dev/null || brew install gh > /dev/null && echo "GitHub CLI installed successfully." || echo "GitHub CLI failed to install. Please try again."
echo "Installing csvkit" && npm list csvkit > /dev/null || brew install csvkit > /dev/null && echo "csvkit installed successfully." || echo "csvkit failed to install. Please try again."
echo "Setup complete."