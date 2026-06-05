#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH -p gpu
#SBATCH -q dev
#SBATCH --time 00:15:00
#SBATCH -A p201230

module load NVHPC CMake Python Doxygen

cmake -B build/gpu-release-local -DCMAKE_BUILD_TYPE=Release -DARCH=gpu
cmake --build build/gpu-release-local -j

./build/gpu-release-local/turbo -t 60000 -s -fp ac1 -arch barebones benchmarks/accap_a3.fzn
