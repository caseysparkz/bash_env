#!/bin/bash
### Runs gpt-2 docker image on port 5000.

sudo docker run --rm -it -e MODE=http -p 5000:5000 deepaiorg/gpt2
