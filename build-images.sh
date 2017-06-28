#!/bin/bash
docker build -t bdii -f dockerfiles/Dockerfile.bdii ./dockerfiles/
docker build -t sitebdii -f dockerfiles/Dockerfile.sitebdii ./dockerfiles/
docker build -t cloudbdii -f dockerfiles/Dockerfile.cloudbdii ./dockerfiles/

