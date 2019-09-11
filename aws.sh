#!/bin/bash

sinteractive() {
    srun "$@" --pty bash -i
}

# AWS P2 Instance Type
#
# Resource requests that mimic as closely as possible the resources of an AWS P2 instance type. 
# * Up to 8 NVIDIA Pascal gtx 1080 ti GPUs with 12 GB memory per GPU (AWS P2 instance type 
#   supports up to 16 K80 GPUs with 12 GB memory per GPU).
# * Up to 32 2.6 GHz Intel Xeon Gold 6142 "Skylake" processors (AWS P2 instance type has up to 64 
#   vCPUs 2.3 GHz Intel Xeon E5-2686 v4 "Broadwell" processors).
p2_xlarge() {
    sinteractive "$@" \
    --gres=gpu:gtx1080ti:1 \
    --mem=61G \
    --nodes=1 \
    --ntasks=1 \
    --cpus-per-task=2 \
    --constraint=cpu_intel_gold_6142
}


# N.B. This instance type is not currently supported by Ibex.
# * GPU nodes have at most 366 GB of usable CPU memory.
# aws_p2_8xlarge() {
#     sinteractive "$@" \
#     --gres=gpu:gtx1080ti:8 \
#     --mem=488G \
#     --nodes=1 \
#     --ntasks=1 \
#     --cpus-per-task=16  
# }


# N.B. This instance type is not currently supported by Ibex.
# * GPU nodes have at most 8 gtx 1080 ti GPUs.
# * GPU nodes have at most 366 GB of usable memory.
# aws_p2_8xlarge() {
#     sinteractive "$@" \
#     --gres=gpu:gtx1080ti:16 \
#     --mem=732G \
#     --nodes=1 \
#     --ntasks=1 \
#     --cpus-per-task=32  
# }


# AWS P3 Instance Type
#
# Resource request that mimics as closely as possible the resources of an AWS P3 instance type. 
# 
# * Up to 4 NVIDIA Tesla V100 GPUs with 32 GB memory per GPU (AWS P3 instance type supports up to 
#   8 V100 GPUs with 16 GB memory per GPU).
# * Up to 32 2.6 GHz Intel Xeon Gold 6142 "Skylake" processors (AWS P3 instance type has up to 64 
#   vCPUs 2.5 GHz Intel Xeon E5-2686 v4 "Broadwell" processors).
# * Instances with multiple V100 GPUs support NVLINK for peer-to-peer GPU communication
p3_2xlarge() {
    sinteractive "$@" \
    --gres=gpu:v100:1 \
    --mem=61G \
    --cpus-per-task=4 \
    --constraint=cpu_intel_gold_6142    
}

p3_8xlarge() {
    sinteractive "$@" \
    --gres=gpu:v100:2 \
    --mem=244G \
    --nodes=1 \
    --ntasks=1 \
    --cpus-per-task=16 \
    --constraint=cpu_intel_gold_6142    
}


# N.B. This instance is not currently available on Ibex.
# * GPU nodes have at most 366G of usable CPU memory.
# p3_16xlarge() {
#    sinteractive "$@" \
#    --gres=gpu:v100:4 \
#    --mem=488G \
#    --nodes=1 \
#    --ntasks=1 \
#    --cpus-per-task=32 \
#    --constraint=cpu_intel_gold_6142
# }

# N.B. This instance is not currently available on Ibex.
# * GPU nodes have at most 4 V100 GPUs with 32 G of memory per GPU.
# * GPU nodes have at most 366G of usable CPU memory.
# * GPU nodes have at most 32 CPUs (64 vCPUs).
# p3dn_24xlarge() {
#     sinteractive "$@" \
#     --gres=gpu:v100:8 \
#     --mem=768G \
#     --nodes=1 \
#     --ntasks=1 \
#     --cpus-per-task=48 \
#     --constraint=cpu_intel_gold_6142
# }