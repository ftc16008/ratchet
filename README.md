# Heavy Duty Ratchet & Pawl for Robot Lift (Parametric)

![Status](https://img.shields.io/badge/Status-Design_Verified-green) ![Material](https://img.shields.io/badge/Recommended_Material-Polycarbonate-blue)

This repository contains a parametric **OpenSCAD** design for a heavy-duty ratchet and pawl system. It is specifically engineered to support a **25 lb (11kg) robot lift** using **goBILDA Viper Slides** and an **8mm REX shaft**.

The primary purpose of this mechanism is to mechanically lock the lift in the extended position, allowing the robot to remain hanging after power is cut, preventing back-driving.

## ⚠️ Critical Engineering Specs

| Specification | Value |
| :--- | :--- |
| **Safe Working Load** | Designed for **25 lbs (11kg)** |
| **Safety Factor** | Calculated at **>20x** (Shear Strength) in Polycarbonate |
| **Mounting Interface** | Bolts to **goBILDA 1309 Series Sonic Hub (8mm REX)** |
| **Shaft Compatibility** | 8mm REX (via Hub) |

> **Note:** The 3D printed gear does *not* interface with the shaft directly; it relies on the bolted metal hub for torque transfer. This prevents the plastic from stripping under high torsion.

## 📂 Files

*   `ratchet_heavy_duty.scad` - The source code. Open this in [OpenSCAD](https://openscad.org/) to modify teeth count, size, or thickness.
*   `ratchet_gear.stl` - (Exported example) 4-Tooth "Anvil" profile.
*   `ratchet_pawl.stl` - (Exported example) Matching directional pawl.

## ⚙️ Customizing the Design

This design is fully parametric. You can adjust the following variables at the top of the `.scad` file to fit your robot:

| Parameter | Default | Description |
| :--- | :--- | :--- |
| `number_of_teeth` | `4` | Fewer teeth = larger, stronger "anvil" style teeth. Recommended range: 4-10. |
| `tooth_depth_mm` | `10` | Depth of the tooth engagement. Deeper = safer locking. |
| `gear_thickness` | `12` | Thickness of the part in mm. |
| `undercut_angle` | `12` | Negative rake angle (degrees). Pulls the pawl *into* the gear under load. |
| `pawl_tail_size` | `14` | Diameter of the rear pawl section (prevents spring hole breakout). |

## 🖨️ Printing Guidelines (Crucial)

Since this part supports a heavy static load, **material choice and slicer settings are critical.**

### Material Recommendation

| Material | Rating | Notes |
| :--- | :--- | :--- |
| **Polycarbonate (PC)** | ⭐⭐⭐⭐⭐ | **Best Choice.** Extremely high strength, zero creep. |
| **Nylon (PA6/PA12)** | ⭐⭐⭐⭐ | Excellent impact resistance and toughness. |
| **PETG** | ⭐⭐⭐ | Acceptable. Ensure 100% infill or very thick walls. |
| **PLA / PLA+** | ❌ **AVOID** | **Danger of Failure.** PLA suffers from "cold flow" (creep). Under a static 25lb load, teeth will deform and slip. |

### Slicer Settings

*   **Perimeters / Walls:** **6 loops minimum** (approx 3mm solid wall). Strength comes from walls, not infill.
*   **Infill:** 40% Gyroid (or 100% solid if using PETG).
*   **Orientation:** Print parts **flat** on the bed. This aligns layer lines perpendicular to the shear force, maximizing strength.
*   **Supports:** None required.

## 🛠️ Assembly & Hardware

### Bill of Materials (Per Side)
*   1x 3D Printed Gear
*   1x 3D Printed Pawl
*   1x **goBILDA 1309-0016-8008** (Sonic Hub, 8mm REX)
*   4x **M4 Socket Head Screws** (14mm - 16mm length) - *To bolt gear to hub*
*   1x **M4 Shoulder Bolt** or Screw/Nut - *For Pawl Pivot*
*   1x Strong **Rubber Band** or **Extension Spring**

### Assembly Instructions
1.  **Insert Hub:** Place the goBILDA 1309 Hub into the center bore of the printed gear.
2.  **Bolt:** Secure the gear to the hub using 4x M4 screws. **Use Threadlocker (Blue Loctite)** on these screws to prevent loosening from vibration.
3.  **Slide Assembly:** Slide the Hub+Gear assembly onto your 8mm REX shaft.
4.  **Mount Pawl:** Mount the pawl to your robot chassis using a screw or shoulder bolt. Ensure it rotates freely but has no wobble.
5.  **Tension:** Attach a spring/rubber band to the hole in the tail of the pawl. Anchor the other end to the chassis so the pawl is pulled **down** into the gear teeth.

## 🧮 Safety Calculations

*Calculated for 25lb load on 60mm diameter gear (30mm radius).*

*   **Torque on Shaft:** ~18.75 lb-in (2.1 Nm).
*   **Force on Tooth:** ~16 lbs (71 N).
*   **Shear Strength (PC):** With a shear area of ~0.36 sq in, the plastic tooth can theoretically withstand >1,000 lbs before shearing.
*   **Recommendation:** It is highly recommended to run **2 sets of ratchets** (one on the left slide assembly, one on the right) to prevent shaft torsion and provide a fail-safe.

## ⚖️ License

[MIT License](LICENSE) - Free to use, modify, and distribute for personal or competition use.