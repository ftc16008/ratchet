Heavy Duty Rachet & Pawl for Robot Lift (Parametric)
This repository contains a parametric OpenSCAD design for a heavy-duty ratchet and pawl system. It is specifically engineered to support a 25 lb (11kg) robot lift using goBILDA Viper Slides and an 8mm REX shaft.

The primary purpose of this mechanism is to mechanically lock the lift in the extended position, allowing the robot to remain hanging after power is cut, preventing back-driving.

⚠️ Critical Engineering Specs
Safe Working Load: Designed for ~25 lbs (11kg).
Safety Factor: Calculated at >20x (shear strength) when printed in Polycarbonate.
Mounting Interface: Bolts to a goBILDA 1309 Series Sonic Hub (8mm REX). Note: The gear does not interface with the shaft directly; it relies on the metal hub for torque transfer to prevent plastic stripping.
📂 Files
ratchet_heavy_duty.scad - The source code. Open this in OpenSCAD to modify teeth, size, or thickness.
ratchet_gear.stl - (Exported example) 4-Tooth "Anvil" profile.
ratchet_pawl.stl - (Exported example) Matching directional pawl.
⚙️ Customizing the Design
This design is fully parametric. You can adjust the following variables at the top of the .scad file:

Parameter	Default	Description
number_of_teeth	4	Fewer teeth = larger, stronger "anvil" style teeth. Recommended range: 4-10.
tooth_depth_mm	10	Depth of the tooth engagement. Deeper = safer locking.
gear_thickness	12	Thickness of the part in mm.
undercut_angle	12	Negative rake angle (degrees). Pulls the pawl into the gear under load.
pawl_tail_size	14	Diameter of the rear pawl section (prevents spring hole breakout).
🖨️ Printing Guidelines (Crucial)
Since this part supports a heavy static load, material choice and slicer settings are critical.

Material Recommendation
Polycarbonate (PC): (⭐⭐⭐⭐⭐) Best choice. Extremely high strength, no creep.
Nylon (PA6/PA12/CF-Nylon): (⭐⭐⭐⭐) Excellent impact resistance.
PETG: (⭐⭐⭐) Acceptable. Ensure 100% infill or very thick walls.
PLA / PLA+: (❌ AVOID) PLA suffers from "cold flow" (creep). Under a static 25lb load, the teeth will slowly deform and eventually slip.
Slicer Settings
Perimeters / Walls: 6 minimum (or ~3mm wall thickness). Strength comes from walls, not infill.
Infill: 40% Gyroid (or 100% solid if using PETG).
Orientation: Print parts flat on the bed. This aligns layer lines perpendicular to the shear force, maximizing strength.
Supports: Not required.
🛠️ Assembly & Hardware

Bill of Materials (Per Side)
1x 3D Printed Gear
1x 3D Printed Pawl
1x goBILDA 1309-0016-8008 (Sonic Hub, 8mm REX)
4x M4 Socket Head Screws (14mm - 16mm length) - To bolt gear to hub
1x M4 Shoulder Bolt or Screw/Nut - For Pawl Pivot
1x Strong Rubber Band or Extension Spring
Instructions
Insert Hub: Place the goBILDA 1309 Hub into the center bore of the printed gear.
Bolt: Secure the gear to the hub using 4x M4 screws. Use Threadlocker (Blue Loctite) on these screws to prevent loosening from vibration.
Slide Assembly: Slide the Hub+Gear assembly onto your 8mm REX shaft.
Mount Pawl: Mount the pawl to your robot chassis using a screw or shoulder bolt. Ensure it rotates freely but has no wobble.
Tension: Attach a spring/rubber band to the hole in the tail of the pawl. Anchor the other end to the chassis so the pawl is pulled down into the gear teeth.
🧮 Safety Calculations
Calculated for 25lb load on 60mm diameter gear (30mm radius).

Torque on Shaft: ~18.75 lb-in (2.1 Nm).
Force on Tooth: ~16 lbs (71 N).
Shear Strength (PC): With a shear area of ~0.36 sq in, the plastic tooth can theoretically withstand >1,000 lbs before shearing.
Redundancy: It is recommended to run 2 sets of ratchets (one on the left slide, one on the right) to prevent shaft torsion and provide a fail-safe.
⚖️ License
MIT License - Free to use, modify, and distribute for personal or competition use.