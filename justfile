# Run `just check` before every pull request. Needs the `opo` command at the version in
# opo-version (`just install`), or set OPO to its path.

opo := env_var_or_default("OPO", "opo")

# Generate the class templates and build every object into build/.
build:
    #!/usr/bin/env bash
    set -euo pipefail
    rm -rf build
    if [ -f templates/classes.yaml ]; then {{opo}} generate --library . -o build; fi
    for d in objects/*/; do
        if [ -f "$d/object.yaml" ]; then {{opo}} build "$d" --library . -o build; fi
    done

# Build, then check every built template and object.
check: build
    #!/usr/bin/env bash
    set -euo pipefail
    shopt -s nullglob
    dirs=(build/library/templates/*/ build/library/objects/*/)
    if [ ${#dirs[@]} -gt 0 ]; then {{opo}} check --root build --ifc ifc/psets.json "${dirs[@]}"; fi
    just golden

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
