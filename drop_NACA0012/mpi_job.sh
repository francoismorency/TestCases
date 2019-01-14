#!/bin/bash
#BATCH --account=def-morency
#SBATCH --nodes=1                # number of nodes
#SBATCH --ntasks-per-node=2               # number of tasks per node 
#SBATCH --mem-per-cpu=512M      # memory; default unit is megabytes
#SBATCH --time=0-00:15           # time (DD-HH:MM)
#this the path to SU2_CFD executable in my home folder
mpirun -n 2 /home/morency/SU2/Falcon/SU2/SU2_CFD/bin/SU2_CFD NACA0012.cfg               # mpirun or mpiexec also work
cp restart_flow.dat solution_flow.dat # copy the flow solution from restart
#this the path to SU2_SOL executable in my home folder, need this step to generate solution file in vtk or tecplot
mpirun -n 1 /home/morency/SU2/impact/projet_givrage/SU2_SOL/bin/SU2_SOL NACA0012.cfg  #work only on one proc
