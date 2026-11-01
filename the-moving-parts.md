# The Moving Parts

**Outcome: you can point at each part
of a running HedgeDoc and say what it
holds — so when something surprises
you, you know which part to interrogate.**

Five parts do all the work. None of
them is exotic, and the boundaries
between them explain nearly every
behaviour in the rest of this guide.

## The server program

HedgeDoc is a **Node.js** program — one
long-running process, started with
`node app.js`, that answers web
requests. It serves the home page, the
editor, the published pages, the
downloads and the small JSON answers
this guide's lab kept collecting. It
holds no notes in its head between
requests: what it knows, it reads from
the database. Stop the program and the
pads stop answering, but nothing is
lost; start it again and it picks up
exactly where it left off — the lab
proved that the blunt way, by killing
the server and finding its notes intact
(transcript `t07`).

## The database

Every note, account, session and
revision lives in one **database**. The
small way — this guide's way — is
**SQLite**: the whole database is a
single file on the disk. After the
lab's afternoon of work, that file was
73 KB and held three notes and one
account. The lab opened it directly and
read the note back out of its table
(transcript `t06`):

```text
tables: ['Authors', 'Notes', 'Revisions', 'Sessions', 'Users', ...]
note row: ('ac276b43-…', 'LFLUzUABt4', 'Saturday Workshop Notes', 277)
```

Three things in that row matter later.
The long `id` is the note's true
identity inside the database. The
`shortid` (`LFLUzUABt4`) is the name the
published and slide views use. And the
title was not typed into any form — the
server took it from the note's own
first heading. Bigger deployments can
use PostgreSQL or MySQL/MariaDB
instead; the program speaks to all of
them through the same layer, and
chapter 12 is honest that the lab only
ever ran the file.

## The browser editor

The editor is a web page the server
sends to each visitor's browser:
Markdown text on the left, the rendered
document on the right, and a toolbar
across the top. All the *rendering* —
turning marks into headings, lists and
tables — happens in the browser, which
is why the same note can be shown three
ways (editing, published, slides) from
one stored text. The editor needs
JavaScript and a live connection to the
server; there is no offline mode in the
1.x line.

## The realtime channel

Under the editor runs a permanent
connection between each browser and the
server, using the **socket.io**
library. Keystrokes travel up it as
small operations — *insert these
characters here, delete those there* —
and the server relays them to every
other browser in the pad and applies
them to its own copy. This channel is
the difference between HedgeDoc and a
wiki: it is why chapter 6 can talk
about typists merging instead of
overwriting. The lab could not type in
two browsers at once, but it did open
the channel and take its handshake
(transcript `t10`):

```text
0{"sid":"0YnG6eYxExWb1c84AAAA","upgrades":["websocket"],
  "pingInterval":5000,"pingTimeout":10000,"maxPayload":1000000}
```

A heartbeat every five seconds is how
the server knows who is still at the
table — and how it counts the "online
users" the status endpoint reports.

## Configuration, uploads and history

Three smaller parts round out the
picture. **Configuration** comes from
environment variables or a `config.json`
file: the address to listen on, the
database's location, who may do what.
Chapter 3 configures a whole instance in
eight variables, and the project's own
configuration document lists the rest.

**Uploads** — pictures pasted or picked
in the editor — are stored as ordinary
files in an `uploads` folder by default
(transcript `t09` fetched one back byte
for byte), with note text holding only
the link. Other backends exist and are
documented-only here.

**Revisions** are the note's memory:
the server periodically snapshots the
document's growth as a chain of
*patches* in the database, which is how
chapter 9's time machine can rebuild
what a note said at an earlier moment —
the lab fetched its first note's one
revision and got the full original text
back (transcript `t06`).
