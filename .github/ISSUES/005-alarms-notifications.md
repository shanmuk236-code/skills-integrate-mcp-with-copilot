Title: Per-session alarms and notifications

Description:
Implement per-session alarm/notification support where users can opt to receive reminders before a session starts. For web, use the Notification API + Service Worker fallback guidance.

Why:
Reminders increase attendance and help users manage their day.

Acceptance criteria:
- UI to set/remove alarm for a session.
- Use browser Notification API for reminders; include instructions for enabling notifications.

Notes: server push (web push) is out-of-scope for initial iteration.

Labels: enhancement
