# Structure — shared rules

Rules that apply to every object of this family (K-01 … K-08). Each object's own sheet is in its `objects/<id>/object.yaml`.

- **Architectural, not structural.** These objects place and size structural members and finishes for drawings, coordination and quantities. Loads, analysis and design are out of scope; members carry their profile and material so a structural tool can take over. Walls, slabs and roofs are OPO class templates too (archetypes `wall` and `area`, see `archetypes.md`); their detailed library sheets are still to write.
- **Profiles** (K-01…K-03) come from one shared profile library, stored as IFC profile definitions (`IfcIShapeProfileDef`, `IfcUShapeProfileDef`, `IfcLShapeProfileDef`, `IfcTShapeProfileDef`, `IfcRectangleHollowProfileDef`, `IfcCircleHollowProfileDef`, `IfcRectangleProfileDef`, `IfcCircleProfileDef`) so IFC export keeps the exact section:
  - **EU steel:** EN 10365 (hot rolled I, H and U sections: IPE, HE A/B/M, HL, HD, HP, UB, UC, IPN, UPE, PFC, UPN), EN 10210-2 / EN 10219-2 (hollow sections). Designation tables *(to collect from openly published maker section tables; check the licence of each source before it goes into the CC0 library)*.
  - **UK steel:** UB, UC, PFC (in EN 10365).
  - **US steel:** AISC shapes (W, M, S, HP, C, MC, L, HSS). The AISC Shapes Database v16.0 is a free download, but building it into software is under an AISC licence agreement *(licence to check before shipping the data in the CC0 library)*.
  - **Timber:** rectangular sections; glulam to EN 14080 *(sizes to collect)*; US dimensional lumber nominal vs. actual (2×4 = 1½" × 3½") *(table to collect)*.
  - **Concrete:** rectangular, circular, custom profile input.
- **Coverings** (K-04…K-07) are `IfcCovering` elements linked to the element they cover (`IfcRelCoversBldgElements`) or the space they finish (`IfcRelCoversSpaces`).
- **LOD (all):** low — centre line or outline · medium — profile outline / finished surfaces · high — fillets, joints, panel and grid lines, connection plates where the sheet says so.

## Sources

- IFC 4.3 enums `IfcColumnTypeEnum`, `IfcBeamTypeEnum`, `IfcMemberTypeEnum` (… BRACE, CHORD, POST, PURLIN, RAFTER, STRUT, STUD …), `IfcCoveringTypeEnum` (CEILING, CLADDING, COPING, FLOORING, MOLDING, SKIRTINGBOARD …), `IfcChimneyTypeEnum` (USERDEFINED / NOTDEFINED only): ifcopenshell IFC4X3_ADD2 schema
- EN 10365:2017 scope and section families (IPE, HE, HL, HLZ, HD, HP, UBP, UB, UC, IPN, J, UPE, PFC, UPN, U, CH); revision prEN 10365:2025 in progress: BSI, UNI, iTeh catalogue pages
- AISC Shapes Database v16.0 (free download; developer licence agreement for use in software): aisc.org
- EN 13964, EN 12825, EN 1443, EN 13229: CEN catalogue titles *(scopes to verify)*
- Ceiling and floor module sizes: typical market values
