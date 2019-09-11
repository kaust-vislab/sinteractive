# Allocating resources on Ibex for interactive computing

Before launching an interactive job on Ibex you will need to allocate resources for interactive 
use using SLURM. The bash scripts in this repository partially automate this process for you. 

To use these scripts clone this repo into `/ibex/fscratch/$USERNAME`. For example, suppose that 
you wish to allocate resources on SLURM that mimic Amazon Web Services (AWS) Instance Types. In 
this case you would run the following command.

```bash
$ source ./aws.sh
```

This loads a number of functions which define resource allocations designed to mimic instance 
types found on AWS. For example, to allocate compute resources on Ibex via SLURM similar to those 
of a [p3.2xlarge](https://aws.amazon.com/ec2/instance-types/p3/) instance type on AWS for 30 
minutes you would run the following command

```bash
$ p3_2xlarge --time=30:00 --resv-ports=1
```