# failed
<!-- git clone https://github.com/vuiseng9/mlm-moe-zoo
https://github.com/yanring/Megatron-MoE-ModelZoo

docker build --no-cache -f B200.Dockerfile --build-arg --rm --network host -t nvpt2506-te2.8-deepep1.2.1 .

d-nv-run -v /root/work:/root/work nvpt2506-te2.8-deepep1.2.1

git clone https://github.com/vuiseng9/megatron-lm
core_v0.13.1

DeepSeek-V2-Lite -->


# working
https://github.com/yanring/Megatron-MoE-ModelZoo
1b93710746711003f029cbaa3608cae7637ec554

This has a best_practice/Qwen3/run_30b.sh
containing 8xb200 commands but it requires slurm. 
Thankfully, there is DRYRUN=1 prefix we can add at the end of the script to just print out the python commands.
`source best_practice/Qwen3/run_30b.sh`

from it prints, we create 
`best_practice/Qwen3/irun_8xb200_30b.sh` which we will need to run on a built docker image.
standard nvidia/pytorch, nemo images dont work because it requires DeepEP etc.

we build a docker using `dockers/B200.Dockerfile`

to run `irun_8xb200_30b.sh`, we need latest megatron-lm.
in the docker image, clone or go to
Megatron-lm main branch
dec 24 
dd7c9f4f6963e133a07515ffc51fa331a8658184 

but first we can use our megatron-tutorials to test the image. we can follow the docker steps of mtuts.

