# Openings — shared rules

Rules that apply to every object of this family (O-01 … O-18). Each object's own sheet is in its `objects/<id>/object.yaml`.

- **Doors** reuse the O-01 dimension chain (wall opening → frame outside → rebate → clear passage, leaf by rebate ± lap/gap) with a selectable nominal reference, IFC `Pset_DoorLiningProperties` / `Pset_DoorPanelProperties`, the same frame types (wrap-around, block, lining, hollow metal) and the same handle and hinge components. Only what differs is listed below.
- **Windows** use one chain: wall opening → (fitting gap) → frame outside → frame (IFC `LiningThickness`) → sash outer → sash (`FrameThickness` in `Pset_WindowPanelProperties`) → glass. Nominal reference: opening, frame outside, or (US) rough opening. IFC `Pset_WindowLiningProperties` (LiningDepth, LiningThickness, TransomThickness, MullionThickness, First/SecondTransomOffset, First/SecondMullionOffset, LiningOffset) and `Pset_WindowPanelProperties` (OperationType, PanelPosition, FrameDepth, FrameThickness). Panel operation values from `IfcWindowPanelOperationEnum` (SIDEHUNGLEFTHAND, TILTANDTURNRIGHTHAND, TOPHUNG, BOTTOMHUNG, PIVOTHORIZONTAL, SLIDINGHORIZONTAL, SLIDINGVERTICAL, FIXEDCASEMENT…).
- **Every window has an editable outline.** All window objects (O-08…O-12, O-14) have an input slot `outline` (closed flat profile in the window plane: arch, circle, triangle, trapezoid, free polygon), edited in the app's sketch mode. **Driving/driven modes:** in rectangle mode width/height drive the outline; in custom mode the outline drives read-only width/height. Frame and sash follow the outline (2D offset), glazing bars are clipped to it, and opening sashes are limited to regions the operation can work in (e.g. a side-hung sash needs a straight hinge edge; otherwise the panel falls back to fixed). Validity: closed, non-self-intersecting, min edge 0.1 m, fits host.
- **Window components** shared by O-08…O-14: frame, sash, glazing (single/double/triple, given as total unit thickness), glazing bars (none / grid / custom), sill (interior board, exterior sill), handle (European espagnolette handle or US crank/latch), opening symbols.
- **Rule sets:** `accessibility` (doors), `escape_windows` (windows), `guards` (low sills / full-height glazing: a sill below the guard height raises a check that a guard or safety glazing is needed).

## Curtain walls — shared rules (O-16, O-17, O-18)

Curtain walls are a key element for high-rise and complex façades, so they get their own sub-family.

- **IFC:** `IfcCurtainWall` (PredefinedType only USERDEFINED / NOTDEFINED → `ObjectType` STICK, UNITISED, STRUCTURAL_GLASS) aggregating `IfcMember` · MULLION (used for vertical mullions *and* horizontal transoms; IFC has no separate transom type), `IfcPlate` · CURTAIN_PANEL (glazed and opaque panels), glass fins as `IfcMember` · USERDEFINED (GLASS_FIN), fixings (spider fittings, clamps, brackets) as discrete accessories / fasteners *(exact IFC class to decide)*, nested windows and doors (O-08, O-12, O-02, O-03) in grid cells. `Pset_CurtainWallCommon` (IsExternal, etc.).
- **Input:** slot `surface` — either a `baseline` (polyline or curve in plan) + bottom/top levels, or a planar / single-curved face (vertical or sloped).
- **Grid:** U (along) and V (up) divisions, each by count, fixed spacing, list of positions, or **levels** (transoms follow storeys: sill, vision, spandrel zones per floor). Grid lines can be added/removed per bay. Corners: outside / inside, mitred or butt-glazed.
- **Panel types per cell:** vision glass (IGU, thickness and make-up as data), spandrel (opaque glass, metal, stone), shadow box, operable vent (nested O-08 / O-12), door (nested O-02 / O-03), louvre, open.
- **Joint types per grid line** (the key difference between systems): `captured` (pressure plate + cover cap), `butt_joint` (silicone joint, no outside cap), `ssg` (structural silicone glazing, 2- or 4-sided, outside flush glass), `open_joint`. Vertical and horizontal lines can differ (e.g. butt-jointed verticals with captured horizontals).
- **Slab edges:** fire-stop / smoke seal line and anchor brackets at each floor slab (high LOD), so the façade reads correctly in section.
- **Rules (all three):** panel size within maker glass limits (data, warning) · mullion depth vs. span (simple rule-of-thumb check; real structural design is out of scope) · joint widths ≥ min · operable vent sizes · `guards` where vision glass reaches the floor (barrier / safety glazing check) · deflection and wind loads are **data only**, not calculated.
- **Based on:** FreeCAD BIM CurtainWall tool (LGPL, reference only: subdivides a base face into panels with vertical, horizontal and diagonal mullions, profiles per direction, glass/solid panels from a multi-material) · IFC · EN 13830 (curtain walling product standard) · structural sealant glazing: ETAG 002 / EN 15434 (bonded glass) · glass design: CEN/TS 19100 (EU, future Eurocode EN 1990-series for glass), ASTM E1300 (US) *(values to add)*.
- **Size catalogues:** none (grid-driven). Presets per system type with typical module widths and profile families *(to collect from public maker data)*.
- **LOD (all three):** low — glass surface with grid lines · medium — mullion/transom sections, glass, spandrels, panel types, nested windows/doors · high — profiles with pressure plates/caps or SSG joints, fins, fixings, slab edge details. Plan: mullion sections cut (hatched) + glass lines; elevation: grid with panel types and opening symbols.

## Sources

- bim-all-doors: github.com/dormakaba/bim-all-doors (CC0), parameters in `Source/Module/01 BAD main/…/90_Parameters.xml`
- FreeCAD BIM CurtainWall: wiki.freecad.org/Arch_CurtainWall (LGPL)
- IFC 4.3: IfcCurtainWallTypeEnum (USERDEFINED, NOTDEFINED), IfcMemberTypeEnum (MULLION…), IfcPlateTypeEnum (CURTAIN_PANEL…)
- EN 13830 scope: din.de, intertek.com; ETAG 002 (EOTA, structural sealant glazing kits); EN 15434 / EN 13022 (bonding) via BSI catalogue
- FreeCAD window presets: wiki.freecad.org/Arch_Window (Fixed, Open 1-pane, Open 2-pane, Sash 2-pane, Sliding 2-pane, Simple door, Glass door, Sliding 4-pane, Awning, Opening only, Sliding door); ArchWindow.py (opening modes)
- Bonsai/IfcOpenShell parametric features and licences: IfcOpenShell repository README (Bonsai GPL-3.0-or-later; libraries LGPL-3.0-or-later)
- US window sizes: angi.com, modernize.com, hansons.com, rustica.com, lowes.com, homeguide.com standard window size guides
- IRC R310: see `../rulesets/README.md`
- Roof windows: velux.co.uk size guide; FAKRO flashing table; DAKEA technical data (shared size range)
- Garage doors: normstahl.com standard sizes; doorsuperstore.co.uk; homedepot.com, clopaydoor.com; garagedoorsonline.co.uk (125 mm steps)
- Generic metric / UK / US door sizes: see `conformance/fixtures/examples/door/README.md`
