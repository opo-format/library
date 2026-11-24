# Run `just check` before every pull request. Needs the `opo` command at the version in
# opo-version (`just install`), or set OPO to its path.

opo := env_var_or_default("OPO", "opo")

# IFC is published under CC BY-ND 4.0, so no IFC data is committed here: the UML sources of
# buildingSMART/IFC4.x-development at the commit in ifc-version are fetched into .cache/ and
# read by `opo ifc` at build time.
ifc:
    #!/usr/bin/env bash
    set -euo pipefail
    rev=$(cat ifc-version)
    src=.cache/ifc/$rev
    if [ ! -d "$src/schemas" ]; then
        rm -rf "$src" && mkdir -p "$src"
        git -C "$src" init -q
        git -C "$src" fetch -q --depth 1 --filter=blob:none https://github.com/buildingSMART/IFC4.x-development "$rev"
        git -C "$src" checkout -q FETCH_HEAD -- schemas
    fi
    {{opo}} ifc "$src/schemas" -o build/ifc

# Generate the class templates and build every object into build/.
build:
    #!/usr/bin/env bash
    set -euo pipefail
    rm -rf build
    just opo={{opo}} ifc
    if [ -f templates/classes.yaml ]; then {{opo}} generate --library . --ifc build/ifc -o build; fi
    for d in objects/*/; do
        if [ -f "$d/object.yaml" ]; then {{opo}} build "$d" --library . -o build; fi
    done

# Build, then check every built template and object.
check: build
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    dirs=(build/library/templates/*/ build/library/objects/*/)
    if [ ${#dirs[@]} -gt 0 ]; then {{opo}} check --root build --ifc build/ifc/psets.json "${dirs[@]}"; fi
    just opo={{opo}} golden

# Until phase 5: the generated templates equal those committed in the standard repository
# (checked out at the commit in opo-spec-version into ./opo-spec).
golden:
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    if [ ! -d opo-spec ]; then echo "golden: ./opo-spec not present, skipped"; exit 0; fi
    for d in build/library/templates/*/; do
        t=$(basename "$d")
        if [ -d "opo-spec/library/templates/$t" ]; then {{opo}} compare "$d" "opo-spec/library/templates/$t" --ignore-generator; fi
    done

# Install opo at the pinned version.
install:
    cargo install --git https://github.com/opo-format/opo-rs --rev "$(cat opo-version)" opo-cli --locked

# Draw a plan and a 3D view of every built object into build/previews/ (not committed).
previews: build
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    mkdir -p build/previews
    for d in build/library/templates/*/ build/library/objects/*/; do
        n=$(basename "$d")
        {{opo}} render "$d" --root build -o "build/previews/$n-plan.svg"
        {{opo}} render "$d" --root build --view model -o "build/previews/$n-model.svg"
    done

# Write a .opo package of every built template and object into build/packages/.
packages: build
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    mkdir -p build/packages
    for d in build/library/templates/*/ build/library/objects/*/; do
        {{opo}} pack "$d" -o "build/packages/$(basename "$d").opo"
    done

# A stable object must have no to_verify values (decision 0017). Run before a release.
release-check: build
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    bad=0
    for f in objects/*/object.yaml; do
        grep -q '^status: "stable"' "$f" || continue
        n=$(basename "$(dirname "$f")")
        out=$({{opo}} check --root build --ifc build/ifc/psets.json "build/library/objects/$n")
        echo "$out"
        if grep -q "values to verify" <<<"$out"; then echo "$n is stable but has values to verify"; bad=1; fi
    done
    exit $bad
