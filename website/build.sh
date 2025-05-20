#!/bin/bash

# Define a function to print help message
print_help() {
  echo "Usage: $0 [options]"
  echo ""
  echo "Options:"
  echo "  -p, --preview  Opens a preview of the website"
  echo "  -b, --build    Produces an optimized website"
  echo ""
}

# Parse command-line options
while [ $# -gt 0 ]; do
  case $1 in
    -p|--preview)
      preview=true
      shift
      ;;
    -b|--build)
      build=true
      shift
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      print_help
      exit 1
      ;;
  esac
done

# Unpack any artifacts if available
if [ -f artifacts.zip ]; then
  unzip -o artifacts.zip -d .
fi

# Make sure all dependencies are installed and up to date
pnpm install

# Preview the website if preview option is on
if [ "$preview" = true ]; then
  pnpm start
fi

# Build the website if build option is on
if [ "$build" = true ]; then
  pnpm build
fi
