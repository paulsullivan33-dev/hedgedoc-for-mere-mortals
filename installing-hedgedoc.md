# Installing HedgeDoc

**Outcome: a HedgeDoc server answering
on your machine, storing notes in a
file you can point at — before any pad
is made.** HedgeDoc the program and
HedgeDoc the *frontend* (the editor web
page) arrive in one archive; the
project's build step turns the source
into the pages the server serves.

## What it needs

The project's own manual setup page
asks for:

- **Node.js 20 or later** — the latest
  long-term-support release is the
  recommendation. The lab's machine had
  a bare Node 24 binary with no
  *corepack* beside it, and corepack is
  how the next item is switched on, so
  the lab downloaded the official Node
  **v22.23.4** tarball from nodejs.org
  and unpacked it into its work folder
  (transcript `t02`). Any Node 20+
  install with corepack present takes
  the shorter path.
- **Yarn 4**, the package manager the
  project pins (version 4.13.0 in this
  release). It is not a separate
  download: `corepack enable` switches
  on shims, and the project's own files
  name the exact Yarn to fetch.
- A **database**. This guide uses
  SQLite, which needs nothing at all —
  the driver is one of the dependencies
  installed below. PostgreSQL and
  MySQL/MariaDB are configured through
  the same settings and are
  documented-only in this guide.
- About **2 GB of spare memory** for
  the frontend build, per the manual.
  The lab capped its build's memory and
  the whole build took about 95 seconds
  on a small shared machine
  (transcript `t04`).

## The release download

The lab installed **1.12.0** from the
project's GitHub releases
(`github.com/hedgedoc/hedgedoc`): one
archive, `hedgedoc-1.12.0.tar.gz`,
about 67 MB, SHA-256
`e84c4ea2e635a84f8a3d77e2a1797e01ecbe695ae1277724af2ce7e6aa40b6e5`
(transcript `t00`). Unpack it where the
server will live. There is no system
installation step: everything HedgeDoc
uses sits inside its own folder, and
deleting the folder removes it.

## Install and build

Inside the unpacked folder, two
commands do the whole job:

```bash
corepack enable
yarn install
yarn build
```

`yarn install` fetches the dependency
tree — some 600 MB in the lab,
including the SQLite driver, which it
compiled and loaded without complaint
(transcript `t03`). `yarn build` runs
the project's webpack build and writes
the finished editor into `public/build/`.
Since release 1.7 the release archive
also carries a prebuilt frontend, so on
a machine that cannot build, the manual
allows skipping this step; the lab
built from source so that what it ran
is exactly what it describes.

## Configuration: eight variables

HedgeDoc reads a `config.json` file or
**environment variables**; variables
win. This guide configures by variable,
because a whole instance fits in a
small launch script (the lab's is
`hedgedoc-lab/run-server.sh`):

```bash
export NODE_ENV=production
export CMD_DOMAIN=localhost
export CMD_HOST=127.0.0.1
export CMD_PORT=18081
export CMD_URL_ADDPORT=true
export CMD_PROTOCOL_USESSL=false
export CMD_DB_URL="sqlite:///path/to/hedgedoc-labwork/db/hedgedoc.sqlite"
export CMD_SESSION_SECRET="a-long-random-string-you-invent"
node app.js
```

The ones that matter most: `CMD_PORT`
is where it listens (3000 by default;
the lab used its own port).
`CMD_DB_URL` names the database — for
SQLite, a file path wearing a
`sqlite://` prefix; keep the file in
its own subfolder, as the project
advises, not in the program's root.
`CMD_DOMAIN` plus `CMD_URL_ADDPORT`
shape the addresses HedgeDoc prints
into redirects and links. And
`CMD_SESSION_SECRET` signs sign-in
cookies: invent a long one and keep it,
because changing it signs everyone out
(chapter 13).

## The check

Start it, and the log tells the story:

```text
info: 	All migrations performed successfully
info: 	HTTP Server listening at 127.0.0.1:18081
```

*Migrations* is the server creating the
database's tables on first run — the
SQLite file now exists. Then ask the
server about itself:

```bash
curl http://127.0.0.1:18081/status
```

```json
{"onlineNotes":0,"onlineUsers":0,"distinctOnlineUsers":0,
 "notesCount":0,"registeredUsers":0,...}
```

and open the home page, whose title —
**"HedgeDoc – Ideas grow better
together"** — is the acceptance test
for this chapter (transcript `t05`).
One warning in the startup log is
normal with SQLite and chapter 13
explains it: *"SQLite does not support
TEXT with options"* is the database
layer tidying its own grammar, not a
fault.

## The other ways in

The project also documents a container
image and a `bin/setup` helper. The lab
verified the manual path only — release
archive, Yarn, `node app.js` — and this
guide's commands are that path's. A
server started by hand like this stops
when its terminal closes; the manual's
later sections show it running under a
service manager for a machine that
serves HedgeDoc full-time, which is
documented-only here.
