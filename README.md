# TactViz
VMD plugin for tactile visualization of biomolecules

Welcome to TactViz version 1.0 !

TactViz is under active development.
To provide feedback, make suggestions, or request features contact:

Jodi Hadden-Perilla, University of Delaware (jhadden@udel.edu)

Visit us on the web at: https://sites.udel.edu/jhadden/

Overview
--------

TactViz is a plugin for the Visual Molecular Dynamics (VMD) software. 
You can download VMD here:
https://www.ks.uiuc.edu/Research/vmd/

TactViz is written in TCL.
You can download TactViz here:
https://github.com/jodihadden/TactViz

TactViz was designed to improve the biomolecular visualization and analysis
experience in VMD for users who are blind or visually impaired. It was developed
based on the needs of student Olivia Shaw in the Hadden Lab at the University of
Delaware. TactViz can be used with electronic refreshable tactile display
devices (e.g., Graphiti) for interactive biomolecular visualization, or it can
be used to produce biomolecular images that can be printed as variable-height
tactile graphics with swell-form machines (e.g., Pictures In A Flash). 
Currently, TactViz only supports tactile visualization of proteins. You can 
download protein structure files (PDBs) from the Protein Data Bank
(https://www.rcsb.org/).

People with disabilities have unique abilities! We hope that public release of
TactViz will promote STEM education for students who are visually impaired and
greater participation of researchers who are visually impaired in STEM fields, 
including computational structural biology, biochemistry, and biophysics.

Citation
--------  

The publication for TactViz is avilable here:
https://scholarworks.rit.edu/jsesd/vol23/iss1/14 

If you use TactViz for your publication, please cite it as follows:

Shaw, Olivia R. and Hadden-Perilla, Jodi A. (2020) 
"TactViz: A VMD Plugin for Tactile Visualization of Protein Structures," 
Journal of Science Education for Students with Disabilities: Vol. 23 : Iss. 1. 

Usage
-----

To use TactViz, first load the plugin into VMD by entering the following on the
VMD command line, substituting the correct path to the script on your computer:

source /path/to/script/tactviz1.0.tcl

All TactViz commands begin with the tv:: prefix.

Run the TactViz help command, tv::help, to see a complete list of available
commands. A complete list of available commands is also provided below. New
commands and features are coming soon!

Commands
--------

tv::new < PDB ID | myfile.pdb >         (Load molecule)

tv::del < molecule ID | top >           (Delete molecule)

tv::swell                               (Apply depth-based shading)

tv::shade < light | medium | dark >     (Adjust shading)

tv::rep < cartoon | surface >           (Change representation)

tv::proj < perspective | orthographic > (Set projection mode)

tv::zoom < in | out >                   (Zoom in or out)

tv::pan < north | south | east | west > (Pan in directions)

tv::rotx < degrees >                    (Rotate about X axis)

tv::roty < degrees >                    (Rotate about Y axis)

tv::rotz < degrees >                    (Rotate about Z axis)

tv::axes                                (Describe viewing direction)

tv::reset                               (Reset viewpoint)

tv::render < filename >                 (Render image to filename)
