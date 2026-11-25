# Shared rule sets

Each variant is a file `rulesets/<id>/<variant>.yaml` (proposal 0002): `opo build` adds it as a rule-set layer to every object that declares the rule set, keeping the fields the object declares. Values carry `source` and `status`; values not yet checked against the norm text are `to_verify` (decision 0017).

Rule sets hold regulation values that several objects check against. They ship as layer files and are **off by default**; a project switches on the ones that apply. Values in the variant files are taken from the sources listed below (Nov 2026). Where a source gives a value in only one unit system, the other is a conversion and is marked ≈.

**Markets.** Europe uses **EN and ISO norms only**; national norms (DIN, NF, UNE, NEN…) are left out. Where no EN/ISO norm sets a value, the EU column says so and the object falls back to project values. The UK (Approved Documents) and the US (IRC, IBC, ADA) are separate markets with their own columns.

Rule-set ids used by the object sheets: `stairs`, `guards`, `handrails`, `accessibility`, `escape_windows`, `kitchen`.

## stairs

There is no EN or ISO norm for stair geometry (EN 15644 covers prefabricated solid-wood stairs as products only). In the EU the `stairs` rule set is empty; projects add their national values as their own rule set layer. The generic metric preset is 175 / 280 mm (2R + G = 630 mm, the classic step formula), which is not a norm value.

## guards

Guard loads come from EN 1991-1-1 (structural, outside OPO's checks).

## accessibility

EN 17210:2021 is the EU accessibility standard, but it states functional requirements only; its numeric guidance is in CEN/TR 17621 (a technical report, not requirements). A revision with requirements and recommendations (prEN 17210:2025) is in progress; when it is published the EU column moves to it. Until then OPO uses ISO 21542 for EU numbers.

## escape_windows

Window objects compute their net clear opening from the open sash, so this check works for casement, hung and sliding windows alike.

## Sources

- ISO 21542:2021 — accessibility summaries of the door, handrail, ramp-width, guarding and control criteria; EN 17210:2021, CEN/TR 17621, prEN 17210:2025 — CEN catalogue pages
- Approved Document K — designingbuildings.co.uk/wiki/Stair_design; buildingcontrol.bathnes.gov.uk/node/47
- IRC R311.7 / R312, IBC 1011 / 1015 — municipal IRC handouts (Boulder, Boise, Knox County, Timnath, Stillwater, Des Moines, Dublin CA, Alameda); iccsafe.org guard commentary; viewrail.com IBC vs IRC
- ADA — access-board.gov guides (ramps, toilet rooms, lavatories) and chapter 6
- AD M ramps — designingbuildings.co.uk/wiki/Ramps
- IRC R310 — municipal egress handouts (St Paul, Boise, Minnesota DLI, Lincoln NE)
- EN 1116 — catas.com UNI EN 1116 summary; standards.iteh.ai EN 1116:2018 abstract
- US kitchen cabinets — kraftmaid.com, angi.com, kitchencabinetkings.com, homedit.com
