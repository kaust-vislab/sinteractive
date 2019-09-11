#!/bin/bash

sinteractive() {
    srun "$@" --pty bash -i
}


n1_highmem_2() {
    sinteractive "$@" \
    --mem=13G \
    --nodes=1 \
    --ntasks=1 \
    --cpus-per-task=1
}


colab_kernel() {
    n1_highmem_2 "$@" \
    --resv-ports=1
}


colab_kernel_with_gpu() {
    n1_highmem_2 "$@" \
    --gres=gpu:gtx1080ti:1 \
    --resv-ports=1
}
