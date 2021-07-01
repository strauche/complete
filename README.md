Enhanced code from Verification Academy.

The code in this repository originated from the Verification Academy course, UVM Basics. I noticed at least one error when running with UVM 1.2 version, so that is fixed. A file structure was added that reflects a realistic structure that would be used on an actual project. To run the simulation, run the python script bin/sim.py. This script runs the QuestaSim qrun command. This example command should work:

>  bin/sim.py test3

To run the code, you need a Questa Simulation (Siemens) license. I plan to add a ModelSim version, since the qrun command is probably not available in ModelSim.
