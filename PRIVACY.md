# Privacy policy

AegisQuery is a local-first desktop database client. This policy explains what
the app does with your data.

## The short version

- No account, no sign-up, no cloud relay and no telemetry.
- Your connection profiles, queries, history and results stay on your Mac.
- The only automatic network request is an optional update check to GitHub.

## What is stored locally

The app stores the following in its application data directory
(`~/Library/Application Support/id.aegis-sentinel.query` for the packaged app,
or `~/.aegisquery` in development):

- connection profiles: name, host, port, database, user, SSL and SSH settings;
- saved queries, saved views, dashboards, projects and workspace tabs;
- query history and local console logs;
- local service settings, job logs and safety backups;
- MCP approval requests.

Passwords are stored in the **macOS Keychain**, not in the profile JSON file. On
other platforms, passwords are stored in the local profile file with `0600`
permissions.

## Network connections

AegisQuery connects only to:

1. **The database servers you configure** — using the drivers bundled with the
   app. Your queries and results go directly between your Mac and those servers.
2. **The local bridge** — `127.0.0.1:9410`, on your own machine.
3. **GitHub** — when the update check runs (at most once per day, and only if
   enabled in Settings). It requests the latest release metadata. No database
   names, queries or connection details are sent.
4. **DuckDB extension servers** — only when you open an Excel file and the
   `excel` extension is not already installed.
5. **Homebrew, Docker or database vendors** — only when you explicitly use the
   Services panel or install client tools. Those tools have their own policies.

There is no analytics service, advertising SDK, crash-reporting service or
remote logging endpoint.

## Diagnostics

The **Export diagnostics** action creates a local JSON file that you choose to
save and share. It contains app/OS versions, masked connection metadata, settings,
service status and recent console lines. Passwords and connection-string
credentials are removed before writing. Nothing is uploaded automatically.

## MCP and AI agents

The MCP server runs locally over stdio. It exposes saved connections and schema
metadata to the AI client you configure. While the desktop app is open, writes
requested by an agent require an in-app approval. You can deny a request or turn
off write access with the MCP environment variables.

## Data deletion

Deleting a connection removes its profile; it does not touch the database
server. Uninstalling the app the normal way does not delete the application data
directory, because macOS keeps support files when an app is moved to the Trash.

To remove everything from inside the app, open **Settings → General → Data**.
Use **Delete all app data** to keep the app installed, or **Uninstall app** to
delete the data and move AegisQuery to the Trash in one step. After typing
`DELETE`, AegisQuery removes:

- connection profiles and SSH settings;
- every AegisQuery database and SSH password in the macOS Keychain, including
  orphan items from connections that were already removed;
- query history, saved queries, views, dashboards and projects;
- service settings, logs, safety backups, demo data and MCP approvals.

The app then quits, so the next launch starts empty. Your actual databases are
not touched. Use the Services panel’s “delete data” option separately when you
intend to remove a local database.

## Children

AegisQuery is a developer tool and is not directed at children.

## Changes

This policy may be updated with the app. The current version is kept in the
repository at `PRIVACY.md`.

## Contact

Email admin@pronteralabs.id or open an issue at <https://github.com/jimmyleonardo/aegis-query-releases/issues>.
