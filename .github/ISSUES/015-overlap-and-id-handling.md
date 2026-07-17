Title: Improve handling and documentation for overlapping sessions and non-unique IDs

Description:
Add detection and better UX/workarounds for overlapping sessions and duplicate session IDs. Document limitations and provide fallback rendering or warnings when data contains conflicts.

Why:
Prevents confusing displays and provides clearer guidance to event data maintainers.

Acceptance criteria:
- Detect overlapping sessions and mark them in the UI with a warning.
- Detect duplicate IDs and log/notify during schedule import; document the issue in `docs/`.

Labels: enhancement
