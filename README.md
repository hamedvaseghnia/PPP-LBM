# Parallelized Pseudo-Potential Lattice Boltzmann Simulation for Two-Phase Droplet Collision

This repository contains a parallelized lattice Boltzmann method (LBM) code implemented in GNU Fortran for simulating the head-on collision of two viscous droplets. The code utilizes the D2Q9 model and is designed to run efficiently on systems with shared memory using OpenMP.

This simulation models the head-on collision of two droplets in a two-phase system using the lattice Boltzmann method with a pseudo-potential Shan-Chen model and D2Q9 model. The domain is periodic and consists of 1,000,000 nodes. This project is aimed at developing a high performance simulator of two-phase flows.

## Features
- **Model:** D2Q9 lattice Boltzmann model for two-phase flows.
- **Parallelization:** Utilizes OpenMP for efficient computation on multi-core processors.
- **Compiler:** Compatible with GNU Fortran 11.4.0.
- **Domain:** Simulates a large periodic domain with 1,000,000 nodes.

## Prerequisites
Before you clone the repository and run the simulation, ensure you have the following installed:
- GNU Fortran (gfortran) 11.4.0 or later
- OpenMP support within the compiler
- Make (for building the executable)

## Installation

To set up the simulation environment on your local machine, follow these steps:
1. Clone the repository:
  git clone https://github.com/yourusername/your-repository.git
2. Compile the code:

This command will use the Makefile provided to compile the source code into an executable named `run`.

## Usage

To run the simulation, execute the following command in the terminal:

./run
