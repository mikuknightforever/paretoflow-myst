# Project working agreement

This agreement applies to `mikuknightforever/paretoflow-myst`, as requested by the repository owner on 2026-09-17.

- Default to working on `main`. Commit and push completed, validated changes directly to `origin/main`; do not require another permission request for this routine publication. Follow any later explicit instruction to use a branch or withhold a push.
- At the first project interaction on a new calendar day in `America/New_York`, check the active development branch and the last successful main synchronization date, stored locally with `git config --local codex.lastMainSyncDate` (`YYYY-MM-DD`). If the value is absent, perform the check now.
- If development is on a branch and that branch has completed changes not yet in main, fetch current remote main, review and validate the integration, merge the ready branch into main, and push main. Resolve routine conflicts and revalidate within the authorized task. This is a conversation-triggered daily catch-up, not a timer or a background job.
- The daily catch-up does not limit normal completed-task pushes; several validated updates may be pushed to main on the same day. Without a new project interaction, this policy does not wake the agent or run unattended.
- Preserve unfinished, unrelated, or concurrently edited work. Do not merge a branch containing unready changes merely to meet the daily cadence. Report a concrete blocker if it cannot be resolved within the task. Do not force-push, discard work, or merge unrelated historical branches.
- If there is nothing new to merge, do not create an empty commit or merge. After verifying that remote main contains the completed work, update the local synchronization date and `codex.lastMainSyncCommit` with the verified remote commit. Never mark a failed push as synchronized.
- Run checks appropriate to the actual change before publishing. For article changes, use the build scripts described in README.md and check relevant links/content. Reuse checks already passed for the unchanged code; documentation-only workflow changes do not require another article build.
- Verify the remote main commit after pushing and report what was published. Track synchronization metadata locally, not as daily commits in the repository.

## Current scope

Keep the unmodified standard MyST article theme and the agreed local-preview setup. The separate Dash repository serves recorded results; article work must not implicitly trigger model training or regenerate experimental data.
