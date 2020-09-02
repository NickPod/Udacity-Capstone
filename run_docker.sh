#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -f Dockerfile . -t capstoneapp --label capstoneapp

# Step 2:
# List docker images
docker image ls --filter label=capstoneapp

# Step 3:
# Run flask app
docker run -it -p 80:80 capstoneapp
