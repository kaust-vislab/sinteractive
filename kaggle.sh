#!/bin/bash

sinteractive() {
    srun "$@" --pty bash -i
}

kernel() {
    sinteractive "$@" \
    --mem=19G \
    --nodes=1 \
    --ntasks=1 \
    --cpus-per-task=2 \
    --constraint=intel \
    --resv-ports=1
}

kernel_with_gpu() {
    sinteractive "$@" \
    --gres=gpu:p100:1 \
    --mem=16G \
    --nodes=1 \
    --ntasks=1 \
    --cpus-per-task=1 \
    --constraint=intel \
    --resv-ports=1
}