Title: Favorites/bookmarks and export/import of favorites

Description:
Allow users to mark sessions as favorites/bookmarks, persist favorites locally, and provide an export (JSON) feature. Optionally provide an import endpoint.

Why:
Users commonly curate a personal schedule; export enables sharing and integration with other apps.

Acceptance criteria:
- Add favorite/unfavorite controls per session.
- Store favorites in browser localStorage (or user-profile if available).
- Provide an "Export favorites" button that downloads a JSON file with favorite session IDs.

Labels: enhancement
