#!/bin/bash
fswatch -0 .| xargs -0 -n1 -I{} ./upload.sh {}
