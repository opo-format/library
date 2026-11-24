# AGENTS.md

This is the **object library** of the OPO format. The rules of the whole project live in the standard repository: read [opo/AGENTS.md](https://github.com/opo-format/opo/blob/main/AGENTS.md), [docs/architecture.md](https://github.com/opo-format/opo/blob/main/docs/architecture.md), [docs/workflow.md](https://github.com/opo-format/opo/blob/main/docs/workflow.md) and [docs/library-sources.md](https://github.com/opo-format/opo/blob/main/docs/library-sources.md) first. They apply here too.

## Specific to this repository
- Objects are YAML sources validated by the published JSON Schema (decision 0014). Never commit built packages, previews or generated tables (decision 0016).
- Every value taken from a norm or a maker carries `source` and `status`; unknown values are `status: to_verify` with a note, never guessed (decision 0017).
- Europe: EN and ISO norms only (decision 0009). UK and US are separate markets with their own size catalogues.
- One object per pull request. Its folder name is its id, lower case with hyphens, never reused.
- `just check` (build and check every object with the pinned `opo` version) must pass before a pull request.
