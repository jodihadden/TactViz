# TactViz
VMD plugin for tactile visualization of biomolecules

Welcome to TactViz version 1.0 !

For feedback, suggestions, and feature requests, contact:
Jodi Hadden-Perilla, University of Delaware (jhadden@udel.edu)

Overview
--------

TactViz is a plugin for the Visual Molecular Dynamics Software (VMD), available
for download here:

https://www.ks.uiuc.edu/Research/vmd/

TactViz is designed to improve the biomolecular visualization and analysis
experience in VMD for users who are blind or visually impaired. It was developed
based on the needs of student Olivia Shaw in the Hadden Lab at the University of
Delaware. If you use TactViz for your research, please cite it as follows:

TactViz: A VMD plugin for tactile visualization of protein structures.
Olivia R. Shaw and Jodi A. Hadden-Perilla.
Journal of Science Education for Students with Disabilities (2020) Accepted.

Usage
-----

To use TactViz, first load the plugin into VMD by entering the following on the
VMD command line, substituting the correct path to the script on your computer:

source /path/to/script/tactviz1.0.tcl

All TactViz commands begin with the tv:: prefix.

Run the TactViz help command, tv::help, to see a complete list of available
commands. A complete list of available commands is also provided below.

Commands
--------

tv::new < PDB ID | myfile.pdb >         (Load molecule)

tv::del < molecule ID | top >           (Delete molecule)

tv::swell                               (Apply depth-based shading)

tv::shade < light | medium | dark >     (Adjust shading)

tv::rep < cartoon | surface >           (Change represetion)

tv::proj < perspective | orthographic > (Set projection mode)

tv::zoom < in | out >                   (Zoom in or out)

tv::pan < north | south | east | west > (Pan in directions)

tv::rotx < degrees >                    (Rotate about X axis)

tv::roty < degrees >                    (Rotate about Y axis)

tv::rotz < degrees >                    (Rotate about Z axis)

tv::axes                                (Describe viewing direction)

tv::reset                               (Reset viewpoint)

tv::render < filename >                 (Render image to filename)
