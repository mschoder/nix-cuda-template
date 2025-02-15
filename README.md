# nix-cuda-template
Templates for working with CUDA in Nix

## Pytorch Test:
```bash
nix develop
$ python
>>> import torch
>>> torch.cuda.is_available()
>>> torch.cuda.device_count()
>>> torch.cuda.get_device_name(0)
```


## CUDA Runtime Test
```bash
nix develop
nvcc hello-world.cu -o hello
./hello
```