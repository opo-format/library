# Furniture — shared rules

Rules that apply to every object of this family (E-01 … E-08). Each object's own sheet is in its `objects/<id>/object.yaml`.

- **No openly licensed parametric basis was found**; objects are generic, based on IFC and market sizes, and kept deliberately simple ("detailed, not a simulator"). Branded pieces come through product bindings (spec §4.12) with the maker's geometry.
- Freestanding: no host; placed on a level. A **use zone** (chair pull-out, bed access, desk legroom) is an optional 2D annotation, not a solid.
- Common components: legs (4 legs, trestle, sled, pedestal, plinth), tops, frames, cushions (sofas), simple material slots.
- Plan symbols follow drawing conventions: outline at low, outline + main divisions (cushions, pillows, chair backs) at medium, from 3D at high.
- IFC: `IfcFurniture` with PredefinedType (CHAIR, TABLE, DESK, BED, SHELF, SOFA, FILECABINET, USERDEFINED); `Pset_FurnitureTypeCommon` (NominalLength/Width/Height, Style, MainColour).

## Sources

- Table and chair heights: castlery.com, wayfair.com, ikea.co.id, planner5d.com dining guides; table sizes per seats: tribesigns.com
- Beds: ikea.com (UK and EU mattress size guides), which.co.uk, tomsguide.com (US sizes), t3.com
- EN 527-1: standards.iteh.ai abstract (desk types A–D, dimensions in Table 1); din.de catalogue
- IFC lighting: ifc43-docs (IfcLightFixtureType, Pset_LightFixtureTypeCommon, IfcLightDistributionDataSourceSelect); docs.rs bimifc-parser lighting module (MPL-2.0)
