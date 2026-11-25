# Circulation — shared rules

Rules that apply to every object of this family (C-01 … C-08). Each object's own sheet is in its `objects/<id>/object.yaml`.

- **Level attachment:** stairs and ramps attach bottom and top to levels (IfcBuildingStorey elevations or explicit heights). Total rise = top − bottom. They declare the **slab opening** they need in the upper slab (outline of the stair + clearance), as a void in the host slab.
- **Stair geometry chain:** total rise → riser count = `ceiling(total_rise / max_riser)` → riser = total_rise / risers → going chosen from the step rule (2R + G target) within the active `stairs` rule set → run length. Walkline at a set offset (default 0.5 m / 18" from the inner edge on winding stairs; IRC measures winders 12" from the narrow side).
- **Stair parts:** flights (IfcStairFlight), landings (IfcSlab · LANDING), treads, risers (closed/open), stringers (side strings: none / cut / closed / wall string), nosing, structure type (timber stringers, steel stringers, concrete waist slab), nested railings (C-07) and handrails (C-08).
- **IFC data:** `Pset_StairCommon` / `Pset_StairFlightCommon` — NumberOfRiser, NumberOfTreads, RiserHeight, TreadLength, NosingLength, WalkingLineOffset, TreadLengthAtOffset, TreadLengthAtInnerSide, WaistThickness, RequiredHeadroom, HandicapAccessible, FireExit.
- **Plan symbol by convention:** cut line at the view's cut height (zig-zag break line), lower part solid, upper part dashed (overhead class), walkline with arrow and "UP"/"DN" text (annotation), riser numbering optional.
- **Rule sets:** `stairs`, `guards`, `handrails`, `accessibility`.
- **Parametric basis:** Bonsai's stair and railing generators (GPL-3.0, reference only); no openly licensed stair basis found yet.

## Sources

- See `../rulesets/README.md` for ISO 21542, AD K, IRC, IBC, ADA, AD M values and their sources.
- Bonsai parametric stair/railing: IfcOpenShell repository (Bonsai GPL-3.0-or-later); railing types FRAMELESS_PANEL and WALL_MOUNTED_HANDRAIL in Bonsai's railing gizmo commits.
- IFC 4.3 documentation: IfcStair, IfcStairFlight, IfcRamp, IfcRailing and their property sets (ifc43-docs.standards.buildingsmart.org).
