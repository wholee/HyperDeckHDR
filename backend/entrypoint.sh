#!/bin/sh
set -e

OUTDIR="/backend/out"

mkdir -p "$OUTDIR"

# Copy everything from build output
cp -r /workspace/out/* "$OUTDIR"
