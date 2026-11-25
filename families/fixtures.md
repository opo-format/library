# Fixtures — shared rules

Rules that apply to every object of this family (F-01 … F-14). Each object's own sheet is in its `objects/<id>/object.yaml`.

- **No openly licensed parametric basis was found** for sanitary ware or kitchen units (only commercial Revit families). These objects are based on IFC, the norms below and generic geometry; branded products attach later through **product bindings** (spec §4.12) with the maker's own geometry.
- **Sanitary terminals** (IfcSanitaryTerminal) carry: connection points (water supply, waste) as snapping points with nominal diameters, the **clearance zone** in front/beside the fixture as a separate 2D/3D zone (annotation class, not a solid), and mounting type (floor-standing, wall-hung on a frame, built-in). Property sets: `Pset_SanitaryTerminalTypeToiletPan`, `…WashHandBasin`, `…Bath`, `…Shower`, `…Sink`, etc.
- **Kitchen units** follow the EN 1116 / US coordinating sizes in `../rulesets/README.md` (`kitchen`) and share components: carcase, plinth/toe kick, fronts (door / drawer / flap, styles: slab, frame), handles (bar, knob, recessed, none), worktop (F-11).
- **Rule sets:** `accessibility` (heights and clearances), `kitchen`.

## Sources

- EN 33, EN 997, EN 80 scope: CEN / BSI catalogue pages; WC dimensions examples from maker data sheets (Laufen, Vitra, Armitage Shanks via NBS) — typical values only
- ISO 21542 and ADA: see `../rulesets/README.md`
- Shower trays: less.co.uk (sizes made by all of Mira, MX, Coram and Merlyn); screwfix.com; US: wayfair.com shower size guides
- Baths: screwfix.com, homebase.co.uk, bathroommountain.co.uk; US: homedepot.com, thisoldhouse.com, aquaticausa.com
- EN 1116 and US kitchen cabinets: see `../rulesets/README.md`
- US appliances: bestonlinecabinets.com, coohom.com cabinet/appliance charts
