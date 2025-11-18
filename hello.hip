// HIP (Heterogeneous-Compute Interface for Portability)
#include <hip/hip_runtime.h>
#include <stdio.h>

__global__ void hello() {
    printf("Hello, World from HIP!\n");
}

int main() {
    hello<<<1, 1>>>();
    hipDeviceSynchronize();
    return 0;
}
