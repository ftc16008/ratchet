// =============================================================
// HEAVY DUTY RATCHET - FIXED PAWL HOLE
// =============================================================

/* [Render Options] */
part_to_show = "assembly"; // [gear, pawl, both, assembly]

/* [Gear Configuration] */
// The image showed 4 teeth. Keep between 4-12 for strength.
number_of_teeth = 4; 
gear_diameter = 60; 
gear_thickness = 12; 
// How "hooked" the teeth are.
undercut_angle = 12; 
// Thickness of the solid tooth (0.1 = thin, 0.9 = blocky)
tooth_body_ratio = 0.65;
// Depth of the tooth cut
tooth_depth_mm = 10;

/* [Mounting (goBILDA 1309 Hub)] */
center_bore = 14; 
mount_spacing = 16; 
mount_hole = 4.1; 

/* [Pawl Configuration] */
pawl_length = 65; 
pawl_width = 20; 
// Size of the round area at the back of the pawl
pawl_tail_size = 14; 
pivot_hole_diameter = 4.1; 
spring_hole_diameter = 3.5;

/* [Settings] */
$fn = 100;
clearance = 0.4;

// =============================================================
// LOGIC & CALCULATIONS
// =============================================================

r_outer = gear_diameter / 2;
r_inner = r_outer - tooth_depth_mm;

// Calculate the center point of the tail circle explicitly
tail_center_x = pawl_length - (pawl_tail_size / 2);

if (part_to_show == "gear") {
    heavy_gear();
} else if (part_to_show == "pawl") {
    heavy_pawl();
} else if (part_to_show == "both") {
    translate([-gear_diameter/1.5, 0, 0]) heavy_gear();
    translate([gear_diameter/1.5, 0, 0]) heavy_pawl();
} else if (part_to_show == "assembly") {
    color("#FFD700") heavy_gear(); // Gold
    
    // Visualize Locked Position
    color("#FFD700") 
    rotate([0,0,180 + (360/number_of_teeth/2)]) 
    translate([-tail_center_x + (pawl_tail_size/2) + 10, r_outer + 5, 0]) 
    rotate([0,0,-15]) 
    heavy_pawl();
}

// =============================================================
// MODULES
// =============================================================

module heavy_gear() {
    difference() {
        linear_extrude(height = gear_thickness) {
            union() {
                // 1. Core Drum
                circle(r = r_inner);
                
                // 2. Anvil Teeth
                for (i = [0 : number_of_teeth - 1]) {
                    rotate([0, 0, i * (360 / number_of_teeth)])
                    hull() {
                        // Root
                        translate([(r_inner-1), 0, 0]) circle(r=1); 
                        
                        // Tip (Undercut)
                        translate([
                            r_outer * cos(-undercut_angle), 
                            r_outer * sin(-undercut_angle), 
                            0
                        ]) circle(r=0.8); 
                        
                        // Heel (Thickness)
                        rotate([0,0, (360/number_of_teeth) * tooth_body_ratio])
                        translate([r_inner, 0, 0]) 
                        circle(r=1);
                    }
                }
            }
        }

        // Holes
        translate([0,0,-1]) {
            cylinder(d = center_bore, h = gear_thickness + 2);
            loc = mount_spacing / 2;
            for(x = [-loc, loc]) {
                for(y = [-loc, loc]) {
                    translate([x, y, 0])
                    cylinder(d = mount_hole, h = gear_thickness + 2);
                }
            }
        }
    }
}

module heavy_pawl() {
    difference() {
        linear_extrude(height = gear_thickness) {
            union() {
                // 1. Arm Body
                hull() {
                    // Pivot Circle
                    translate([0,0,0]) circle(d = pawl_width); 
                    
                    // Tail Circle (Where the spring goes)
                    translate([tail_center_x, 0, 0])
                    circle(d = pawl_tail_size); 
                }
                
                // 2. The Hook Tooth
                translate([pawl_width/4, -pawl_width/2, 0]) 
                hull() {
                    // Base inside arm
                    translate([0, 2, 0]) square([10, 1]);
                    
                    // Tooth Tip
                    translate([5, -tooth_depth_mm + clearance, 0]) 
                    circle(r=1); // Rounded tip prevents chipping
                }
            }
        }
        
        // HOLES
        translate([0,0,-1]) {
            // Pivot Hole
            cylinder(d = pivot_hole_diameter, h = gear_thickness + 2);
            
            // Spring Hole - NOW CENTERED IN TAIL
            // This guarantees it will never cut the edge
            translate([tail_center_x, 0, 0])
            cylinder(d = spring_hole_diameter, h = gear_thickness + 2);
        }
    }
}