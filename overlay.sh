#!/bin/sh
mkdir overlay
cd overlay
mkdir {lower,upper,work,merged}
sudo mount -t overlay overlay -o lowerdir=lower, uperdir=upper, workdir=work merged
