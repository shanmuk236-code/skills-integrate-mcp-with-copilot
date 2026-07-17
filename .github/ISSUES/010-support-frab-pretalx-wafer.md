Title: Support Frab/Pretalx/Wafer schedule formats and pluggable adapters

Description:
Add support for common conference schedule formats (Frab XML/JSON, Pretalx, Wafer) and design a pluggable `ScheduleFormat` adapter interface so additional formats can be added.

Why:
Allows importing structured event data from established backends.

Acceptance criteria:
- Implement parsers for Frab XML and Frab JSON at minimum.
- Define adapter interface to add more formats later.

Labels: enhancement
