#!/bin/bash

set -e

# Run the Pylint first
pylint --fail-under=8 src/ 
pylint -E --fail-under=8 src/ || pylint-exit $?
if [ $? -ne 0 ]; then
  echo "An error occurred while running pylint." >&2
  exit 1
fi

# Run the test cases and break if it is less than minimum coverage
pytest
