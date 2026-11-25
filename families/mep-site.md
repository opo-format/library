# MEP and site — shared rules

Rules that apply to every object of this family (G-01 … M-06). Each object's own sheet is in its `objects/<id>/object.yaml`.

These are the visible ends of building services and the common site elements that architects place and draw. Pipes, ducts, cables and their sizing belong to MEP tools, not OPO.

Shared rules for this family:
- **MEP terminals** (M-) are `IfcFlowTerminal` subtypes (or `IfcFlowController` for switches). Each has **ports** as data (`IfcDistributionPort`: system type, nominal size, flow direction) so an MEP tool can connect to it; OPO does not route anything.
- **Host:** a wall, ceiling (K-04) or floor. Wall-hosted items take a height above the finished floor; ceiling-hosted items snap to the ceiling grid when the host has one.
- **Symbols:** plan and reflected-ceiling symbols are part of the object's representations (semantic line classes, spec §4.6). There is no single EN/ISO symbol set for architectural drawings of these items, so OPO ships neutral default symbols and lets a project swap the symbol representation by layer.
- **LOD (all):** low — symbol only · medium — simple body + symbol · high — body detail (grille slots, radiator panels, plate and rocker).

## Sources

- IFC 4.3 enums `IfcSpaceHeaterTypeEnum` (CONVECTOR, RADIATOR), `IfcAirTerminalTypeEnum` (DIFFUSER, GRILLE, LOUVRE, REGISTER), `IfcOutletTypeEnum`, `IfcSwitchingDeviceTypeEnum` (… DIMMERSWITCH, KEYPAD, MOMENTARYSWITCH, TOGGLESWITCH …), `IfcFireSuppressionTerminalTypeEnum` (… HOSEREEL, SPRINKLER …), `IfcGeographicElementTypeEnum` (VEGETATION …), `IfcSignTypeEnum` (MARKER, MIRROR, PICTORAL), `IfcFurnitureTypeEnum` (no site furniture types): ifcopenshell IFC4X3_ADD2 schema
- ISO 21542 controls height 800–1100 mm: see `../rulesets/README.md`
- EN 442, EN 12845, EN 671-1, IEC 60884, ISO 7010, NFPA 13: catalogue titles *(scopes and values to verify before building)*
- Radiator panel types, plate sizes, outlet heights: typical market values
