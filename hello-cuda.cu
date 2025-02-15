#include <iostream>
#include <cuda_runtime.h>

// CUDA kernel function
__global__ void helloFromGPU()
{
  printf("Hello, World from the GPU!\n");
}

int main()
{
  std::cout << "Hello, World from the CPU!" << std::endl;

  // Launch the CUDA kernel with 1 block and 1 thread
  helloFromGPU<<<1, 1>>>();

  // Check for kernel launch errors
  cudaError_t err = cudaGetLastError();
  if (err != cudaSuccess)
  {
    std::cerr << "CUDA Error: " << cudaGetErrorString(err) << std::endl;
    return -1;
  }

  // Wait for GPU to finish before exiting
  err = cudaDeviceSynchronize();
  if (err != cudaSuccess)
  {
    std::cerr << "CUDA Sync Error: " << cudaGetErrorString(err) << std::endl;
    return -1;
  }

  return 0;
}
