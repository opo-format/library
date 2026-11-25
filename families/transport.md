# Transport — shared rules

Rules that apply to every object of this family (T-01 … T-03). Each object's own sheet is in its `objects/<id>/object.yaml`.

- **IFC:** `IfcTransportElement` (subtype of `IfcTransportationDevice`) with IFC 4.3 `IfcTransportElementTypeEnum`: **ELEVATOR, ESCALATOR, MOVINGWALKWAY** (also CRANEWAY, HAULINGGEAR, LIFTINGGEAR, not used here). Property sets `Pset_TransportElementCommon` and, for lifts, `Pset_TransportElementElevator` *(names to verify against the IFCX snapshot)*.
- **Scope rule:** these objects give the architect the **spaces** a lift or escalator needs and a recognisable body: shaft, pit, headroom, car, landing doors, truss, balustrades, the floor openings they cut. Machinery, guide rails, counterweights, controllers and drives are not modelled ("detailed, not a simulator"). Maker data replaces the defaults when a product is chosen.
- **Host:** the building's levels. Each object spans a list of levels and cuts openings in the slabs it passes (`IfcOpeningElement` per slab, like the door's void).
- **Norms:** EU — EN 81-20 (lifts: construction and installation), EN 81-70 (accessibility of lifts; ISO 8100-7 is the international counterpart), EN 115-1 (escalators and moving walks) · US — ASME A17.1 (safety code for elevators and escalators), 2010 ADA Standards §407 (lift cars) · UK — the same EN standards.
- **LOD (all):** low — outline of shaft or truss with the symbol (cross in a lift shaft, arrow on an escalator) · medium — car, doors, steps/pallets as a surface, balustrades · high — door panels and frames, handrail profiles, comb plates.

## Sources

- IFC 4.3 `IfcTransportElementTypeEnum` (CRANEWAY, ELEVATOR, ESCALATOR, HAULINGGEAR, LIFTINGGEAR, MOVINGWALKWAY): ifcopenshell IFC4X3_ADD2 schema
- EN 81-70 car types 1–5: maker and consultant summaries of EN 81-70:2021 (car and door minimums); ISO 8100-7:2024 counterpart
- EN 115-1 inclination (≤ 30°, 35° up to 6 m rise at ≤ 0.5 m/s), step widths 600/800/1000 mm, moving walks 0–12° with 800/1000 mm pallets: escalator maker planning guides
- ASME A17.1 / CSA B44: SAI Global catalogue page (scope)
