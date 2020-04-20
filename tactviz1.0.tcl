##
## TactViz 1.0
##
## A script to create tactile-image-friendly representations of proteins in VMD
##
## Authors: Jodi Hadden-Perilla and Olivia Shaw, 2020
## Department of Chemistry and Biochemistry, University of Delaware
##
## To make a suggestion or request a feature, contact us at jhadden@udel.edu
##

package provide tv 1.0

namespace eval tv:: {
  namespace export tv
}

#
# Display
#
display rendermode GLSL
display projection orthographic
display depthcue on
display nearclip set 0.01
display cuedensity 0.45
display shadows off
color Display Background white
axes location off
light 0 on
light 0 pos [display get eyepos]
light 1 off
light 2 off
light 3 off

#
# Materials
#
set mlist { TactileSolid }
set mymlist [material list]
foreach mat $mlist {
  if { [lsearch $mymlist $mat] == -1 } {
    material add $mat
  }
}
material change ambient TactileSolid 0.000000
material change diffuse TactileSolid 1.000000
material change specular TactileSolid 0.000000
material change shininess TactileSolid 0.000000
material change mirror TactileSolid 0.000000
material change opacity TactileSolid 1.000000
material change outline TactileSolid 0.000000
material change outlinewidth TactileSolid 0.000000
material change transmode TactileSolid 0.000000

#
# Drawing Method
#
proc tv::swell {} {
  mol modselect 0 top "protein"
  mol modcolor 0 top ColorID 2
  mol modstyle 0 top NewCartoon 0.600000 12.000000 2.350000 0
  mol modmaterial 0 top TactileSolid
  puts "Default representation applied"
}

#
# Representation
#
proc tv::rep { args } {
  if { $args == "NewCartoon" || $args == "cartoon" || $args == "cart" || $args == "c" } {
    mol modstyle 0 top NewCartoon 0.600000 12.000000 2.350000 0
    puts "Representation changed to New Cartoon"
  } elseif { $args == "QuickSurf" || $args == "surface" || $args == "surf"|| $args == "s" } {
    mol modstyle 0 top QuickSurf 1.000000 0.500000 1.000000 2.000000
    puts "Representation changed to QuickSurf"
  } else {
    puts "Representation options are: cartoon (c) or surface (s)"
  }
}

#
# Shading
#
proc tv::shade { args } {
  if { $args == "light" || $args == "l" || $args == "1" } {
    mol modcolor 0 top ColorID 6 ; # silver
    puts "Shading set to light"
  } elseif { $args == "medium" || $args == "med" || $args == "m" || $args == "2" } {
    mol modcolor 0 top ColorID 2 ; # gray
    puts "Shading set to medium"
  } elseif { $args == "dark" || $args == "d" || $args == "3" } {
    mol modcolor 0 top ColorID 16 ; # black
    puts "Shading set to dark"
  } else {
    puts "Shading options are: light (1), medium (2), or dark (3)"
  }
}

#
# Projection
#
proc tv::proj { args } {
  if { $args == "perspective" || $args == "persp" || $args == "p" } {
    display argsection perspective
    puts "Projection is perspective"
  } elseif { $args == "orthographic" || $args == "ortho" || $args == "o" } {
    display argsection orthographic
    puts "Projection is orthographic"
  } else {
    puts "Projection options are: perspective (p) or orthographic (o)"
  }
}

#
# Zoom
#
proc tv::zoom { args } {
  if { $args == "in" || $args == "i" } {
    scale by 1.2
    puts "Zoomed in"
  } elseif { $args == "out" || $args == "o" } {
    scale by 0.833
    puts "Zoomed out"
  } else {
    puts "Zoom options are: in (i) or out (o)"
  }
}

#
# Pan
#
proc tv::pan { args } {
  if { $args == "north" || $args == "n"} {
    translate by 0 0.2 0
    puts "Panned north"
  } elseif { $args == "south" || $args == "s"} {
    translate by 0 -0.2 0
    puts "Panned south"
  } elseif { $args == "east" || $args == "e"} {
    translate by 0.2 0 0
    puts "Panned east"
  } elseif { $args == "west" || $args == "w"} {
    translate by -0.2 0 0
    puts "Panned west"
  } else {
    puts "Pan options are: north (n), south (s), east (e), or west (w)"
  }
}

#
# Rotations
#
proc tv::rotx { args } {
  if { $args != "" } {
    rotate x by $args
    puts "Rotated about X-axis by $args degrees"
    tv::axes
  } else {
    puts "Provide number of degrees to rotate by"
  }
}
proc tv::roty { args } {
  if { $args != "" } {
    rotate y by $args
    puts "Rotated about Y-axis by $args degrees"
    tv::axes
  } else {
    puts "Provide number of degrees to rotate by"
  }
}
proc tv::rotz { args } {
  if { $args != "" } {
    rotate z by $args
    puts "Rotated about Z-axis by $args degrees"
    tv::axes
  } else {
    puts "Provide number of degrees to rotate by"
  }
}

#
# Reset view
#
proc tv::reset {} {
  display resetview
  puts "Viewpoint reset"
}

#
# Viewing direction
#
proc tv::axes {} {
  # Viewing direction vector
  set R [lindex [molinfo top get rotate_matrix] 0]
  set viewdir [coordtrans [measure inverse $R] {0 0 -1}]
  # North and east vectors
  set north [coordtrans [measure inverse [lindex [molinfo top get rotate_matrix] 0]] [list 0 1 0]]
  set east [coordtrans [measure inverse [lindex [molinfo top get rotate_matrix] 0]] [list 1 0 0]]
  # Check if direction is cardinal
  set vector [list $viewdir $north $east]
  for {set i 0} {$i < 3} {incr i} {
    if { [lindex [lindex $vector $i] 0] < 1.001 && [lindex [lindex $vector $i] 0] > 0.999 } { ; # +x
      set c($i) "+X"
    } elseif { [lindex [lindex $vector $i] 0] > -1.001 && [lindex [lindex $vector $i] 0] < -0.999 } { ; # -x
      set c($i) "-X"
    } elseif { [lindex [lindex $vector $i] 1] < 1.001 && [lindex [lindex $vector $i] 1] > 0.999 } { ; # +y
      set c($i) "+Y"
    } elseif { [lindex [lindex $vector $i] 1] > -1.001 && [lindex [lindex $vector $i] 1] < -0.999 } { ; # -y
      set c($i) "-Y"
    } elseif { [lindex [lindex $vector $i] 2] < 1.001 && [lindex [lindex $vector $i] 2] > 0.999 } { ; # +z
      set c($i) "+Z"
    } elseif { [lindex [lindex $vector $i] 2] > -1.001 && [lindex [lindex $vector $i] 2] < -0.999 } { ; # -z
      set c($i) "-Z"
    } else {
      set c($i) "non-cardinal"
    }
  }
  puts "Viewing direction is $c(0)"
  puts "North is $c(1) and East is $c(2)"
}

#
# Load molecule
#
proc tv::new { args } {
  if { $args != "" } {
    mol new $args
    puts "Molecule $args loaded"
    tv::swell
  } else {
    puts "Provide PDB ID or myfile.pdb"
  }
}

#
# Delete molecule
#
proc tv::del { args } {
  if { $args != "" } {
    mol delete $args
    puts "Molecule $args deleted"
  } else {
    puts "Indicate molecule ID or top"
  }
}

#
# Render image
#
proc tv::render { args } {
  if { $args != "" } {
    ::render snapshot $args.tga display %s
    puts "Image rendered to filename: [pwd]/$args.tga"
  } else {
    puts "Provide filename"
  }
}

#
# Render STL file
#
proc tv::stl { args } {
  if { $args != "" } {
    ::render STL $args.stl true
    puts "Image rendered to filename: [pwd]/$args.stl"
  } else {
    puts "Provide filename"
  }
}

#
# Help menu
#
proc tv::help {} {
  puts "TactViz user options are:"
  puts "\ttv::new < PDB ID | myfile.pdb > (Load molecule)"
  puts "\ttv::del < molecule ID | top > (Delete molecule)"
  puts "\ttv::swell (Apply depth-based shading)"
  puts "\ttv::shade < light | medium | dark > (Adjust shading)"
  puts "\ttv::rep < cartoon | surface > (Change representation)"
  puts "\ttv::proj < perspective | orthographic > (Set projection mode)"
  puts "\ttv::zoom < in | out > (Zoom in or out)"
  puts "\ttv::pan < north | south | east | west > (Pan in directions)"
  puts "\ttv::rotx < degrees > (Rotate about X axis)"
  puts "\ttv::roty < degrees > (Rotate about Y axis)"
  puts "\ttv::rotz < degrees > (Rotate about Z axis)"
  puts "\ttv::axes (Describe viewing direction)"
  puts "\ttv::reset (Reset viewpoint)"
  puts "\ttv::render < filename > (Render image to filename)"
  puts "\ttv::stl < filename > (Render STL file to filename)"
}

#
# Startup
#
if {[molinfo top] != -1} {
  tv::swell
}
puts "TactViz enabled"
puts "For a list of options, enter tv::help"
