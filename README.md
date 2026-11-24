# OPO library

Objects for the [OPO format](https://github.com/opo-format/opo) (Open Parametric Object): object sources written in YAML, a class template for every IFC element class, rule sets, materials and hatches.

> Status: [phase 4 of the migration](https://github.com/opo-format/opo/blob/main/docs/migration.md): class templates and the door move here.

Sources are compiled into `.opo` packages by the `opo` command from [opo-rs](https://github.com/opo-format/opo-rs). Built packages are published with each release, not committed.

Licence: objects are CC0-1.0 (public domain dedication) unless a file says otherwise. Every cited source is listed in `references.yaml`.

## Layout

```
objects/<id>/          object.yaml, layers/*.yaml (proposal 0002)
templates/             archetypes/*.yaml and classes.yaml: the class templates
ifc/                   IFC 4.3 ADD2 data extracted for the generator
styles/                materials.yaml and hatches.yaml, embedded into objects at build
references.yaml        every cited source
opo-version            the opo-rs commit the library is built with
opo-spec-version       the standard repository commit the templates are compared with (until phase 5)
```

## Building

```sh
just install    # the opo command at the pinned version
just check      # generate templates, build objects, opo check, golden comparison
just previews   # SVG plans and 3D views in build/previews/ (not committed)
```
