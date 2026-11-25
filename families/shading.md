# Shading — shared rules

Rules that apply to every object of this family (S-01 … S-07). Each object's own sheet is in its `objects/<id>/object.yaml`.

- **IFC:** `IfcShadingDevice` (a built element). IFC 4.3 `IfcShadingDeviceTypeEnum` has only **AWNING, JALOUSIE, SHUTTER** (+ USERDEFINED, NOTDEFINED). Louvres, fins and screens use USERDEFINED with `ObjectType` LOUVRE / FIN / SCREEN. Property set `Pset_ShadingDeviceCommon` *(name to verify against the IFCX snapshot)* (operation, solar and visible transmittance and reflectance as data).
- **Host:** a window or door (sits in front of, inside or above its opening and takes its size from it), a curtain wall (follows its grid), or a free façade surface. Hosted devices update when the host opening changes size, including windows with an edited outline (shading follows the outline's bounding box, or the outline itself where the device type allows).
- **Position** relative to the host: `in_reveal` | `face_fixed` (on the wall face) | `projecting` (brackets off the face). Positions per type below.
- **Operation:** `fixed` | `manual` | `motorised` (data only; motors and controls are not modelled). Movable devices have an `open_state` parameter (0–1, or slat angle) so drawings can show them open, closed or at an angle.
- **Norms (EU):** EN 13659 (shutters and external venetian blinds) and EN 13561 (external blinds and awnings) are performance standards: wind resistance class, operating force, safety. They set **no sizes**, so OPO carries their classes as data and sizes come from maker ranges. EN 12216 is the terminology standard that names the product types. UK uses the same EN standards; the US has no matching product standard (wind loads per ASCE 7, data only).
- **Rules (all):** device within host and maker size limits *(data, warning)* · movable devices clear of opening sashes (check against the hosted window's swing, warning) · box/headbox fits the lintel or is surface-mounted (check).
- **LOD (all):** low — outline or box only · medium — slats/panels at the drawn open state, guide rails, box · high — slat profiles, brackets, end caps. Plan and section show the box and the projection; elevation shows the slats or panel pattern.

## Sources

- IFC 4.3 `IfcShadingDeviceTypeEnum` (AWNING, JALOUSIE, SHUTTER, USERDEFINED, NOTDEFINED): ifcopenshell IFC4X3_ADD2 schema
- EN 13659:2015 scope (external venetian blind, roller shutter, wing shutter, Venetian shutter, concertina shutter, sliding panel shutter): BSI / EVS catalogue pages
- EN 13561:2015 scope (folding arm, pivot arm, vertical roller blind, façade awning, Dutch awning, brise-soleil…; no wind resistance for non-retractable products): DIN catalogue page (EN text)
- Slat widths, shutter slat heights: typical maker values, to verify against public data sheets before building
