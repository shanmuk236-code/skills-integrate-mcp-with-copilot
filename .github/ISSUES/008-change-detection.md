Title: Program-change detection and change UI

Description:
Detect changes between schedule refreshes and surface changes to users (new/canceled/changed sessions). Add a simple "What's changed" view listing differences since last sync.

Why:
Users need to be aware of schedule changes when attending events.

Acceptance criteria:
- On refresh, compute diffs between local schedule and remote schedule.
- Show a changes view categorizing additions, removals, and updates.

Labels: enhancement
