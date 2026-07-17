Title: Global session search and multi-criteria filtering

Description:
Add server-side and client-side search across all sessions and filters for room/track/keyword/time. Search should be efficient for modest datasets and provide fuzzy-matching suggestions.

Why:
Enables users to quickly find sessions of interest in large schedules.

Acceptance criteria:
- Add `/search` API or extend `/activities` with query params for `q`, `room`, `track`, `date`.
- Add search box and filter controls in the UI; results update dynamically.

Labels: enhancement
