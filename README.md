# OPO library

Objects for the [OPO format](https://github.com/opo-format/opo) (Open Parametric Object): object sources written in YAML, a class template for every IFC element class, rule sets, materials and hatches.

> Status: [phase 4 of the migration](https://github.com/opo-format/opo/blob/main/docs/migration.md): class templates and the door move here.

Sources are compiled into `.opo` packages by the `opo` command from [opo-rs](https://github.com/opo-format/opo-rs). Built packages are published with each release, not committed.

Licence: objects are CC0-1.0 (public domain dedication) unless a file says otherwise. Every cited source is listed in `references.yaml`.

## Layout

```
objects/<id>/          object.yaml, layers/*.yaml (proposal 0002)
templates/             archetypes/*.yaml and classes.yaml: the class templates
styles/                materials.yaml and hatches.yaml, embedded into objects at build
references.yaml        every cited source
opo-version            the opo-rs commit the library is built with
ifc-version            the buildingSMART/IFC4.x-development commit whose UML sources `opo ifc` reads at build
opo-spec-version       the standard repository commit whose conformance fixtures the templates are compared with
```

## Building

```sh
just install    # the opo command at the pinned version
just check      # generate templates, build objects, opo check, golden comparison
just previews   # SVG plans and 3D views in build/previews/ (not committed)
just packages   # a .opo package of every template and object in build/packages/
```

IFC is published by buildingSMART under CC BY-ND 4.0, so no IFC data is kept in this repository; `just ifc` fetches the pinned UML sources into `.cache/` and extracts the class and property set names into `build/ifc/`.

CI uploads the previews of every pull request as an artifact. Publishing a GitHub release runs `just release-check` (a `stable` object may have no `to_verify` values) and attaches the `.opo` packages to the release.

## Catalogue

Every object has a folder under `objects/`, including the ones not yet built: a `planned` object is a catalogue entry with its specification sheet in `object.yaml` (priority, catalogue number, IFC class, scope and the planned inputs, parameters, rules, size catalogues and levels of detail). `just check` writes the catalogue to `build/catalogue.md` and the IFC coverage table (every IFC element class with its archetype, template and library objects) to `build/coverage.md`; both are generated, not committed.
