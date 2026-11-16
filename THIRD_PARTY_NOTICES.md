# Third-party notices

AegisQuery bundles or depends on the following open-source components. Their
licenses apply to those components; the AegisQuery application itself is
proprietary (see [LICENSE](LICENSE)).

This list covers the main runtime components. Transitive dependencies keep their
own licenses and notices in their source distributions.

## Application shell and UI

| Component | Version | License |
|---|---|---|
| Tauri | 2.x | MIT OR Apache-2.0 |
| tauri-plugin-dialog | 2.x | MIT OR Apache-2.0 |
| tauri-plugin-window-state | 2.x | MIT OR Apache-2.0 |
| React / React DOM | 19.x | MIT |
| @tauri-apps/api | 2.x | Apache-2.0 OR MIT |
| @tauri-apps/plugin-dialog | 2.x | MIT OR Apache-2.0 |
| @tanstack/react-virtual | 3.x | MIT |
| Vite | 8.x | MIT |
| TypeScript | 6.x | Apache-2.0 |
| @vitejs/plugin-react | 6.x | MIT |

## Local bridge and database drivers

| Component | Version | License |
|---|---|---|
| Node.js runtime (bundled as a Node SEA sidecar) | 26.x | MIT |
| ws | 8.x | MIT |
| pg | 8.x | MIT |
| mysql2 | 3.x | MIT |
| mongodb | 6.x | Apache-2.0 |
| ioredis | 5.x | MIT |
| SQLite (`node:sqlite`) | system | Public Domain |

## Data-file preview

| Component | Version | License |
|---|---|---|
| DuckDB CLI | 1.3.x | MIT |

The DuckDB CLI is downloaded from the official DuckDB GitHub release during the
desktop build. Excel support may download DuckDB's `excel` extension on first
use; the extension is distributed by the DuckDB project.

## Build and developer tooling

| Component | Version | License |
|---|---|---|
| esbuild | 0.25.x | MIT |
| javascript-obfuscator | 5.x | BSD-2-Clause |
| concurrently | 9.x | MIT |

## External tools (not bundled)

AegisQuery can invoke tools that you install yourself:

- Homebrew and Homebrew formulae (BSD-2-Clause for Homebrew; each formula keeps
  its own license);
- Docker Desktop, Colima and container images (their own licenses);
- PostgreSQL, MySQL, MariaDB, MongoDB and Redis servers and client tools;
- `pg_dump`, `mysqldump`, `mongodump`, `redis-cli`, `psql`, `mysql` and `mongosh`.

Those tools are not part of AegisQuery and are governed by their own terms.

## Full license texts

Full texts are available in each upstream project. For the exact versions used
by a build, inspect `package-lock.json`, `ui/package-lock.json` and
`ui/src-tauri/Cargo.lock`.

If you redistribute AegisQuery, keep this file, the `LICENSE` file and the
licenses of the bundled components together with the installer.
