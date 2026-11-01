# Glossary

**Front matter** — the block of YAML
labels between `---` fences at the very
top of a pad: its title, description,
tags and kind. Read by the server as
facts about the note; wins over the
body's own first heading.

**FreeURL** — the optional behaviour
where visiting a not-yet-existing note
address creates the note. Off by
default in HedgeDoc; a fresh address
answers 404 instead.

**Guest** — a visitor with no account.
On a default instance guests can read
pads, create them, and edit any pad
whose permission allows it.

**History** — the list of pads you have
visited and made, kept by your browser
and synced by the web page's scripts.
A convenience of the browser, not the
instance's catalogue.

**Markdown** — the plain-text notation
pads are written in: `#` for headings,
`**` for bold, `- ` for lists, and a
little more. What you type is what is
stored.

**Note / pad** — one HedgeDoc document.
The project calls it a note; this guide
also calls it a pad, for the shared
writing surface it behaves like. Same
thing.

**Note ID and short ID** — a note has
two names: the long ID in its editing
address, and a short ID used by the
published (`/s/`) and slide (`/p/`)
views. Both point at one stored text.

**Operation** — one small editing
instruction — insert these characters
here, delete those there — sent by a
browser and merged by the server into
the document's single sequence of
changes.

**Operational transformation** — the
technique that merges many typists'
operations into one consistent
document without locks or overwriting.
The reason a pad has no save button.

**Permission** — a note's sharing
level: one of Freely, Editable,
Limited, Locked, Protected or Private,
dividing the world into owner,
signed-in users and guests.

**Published view** — the clean,
read-only rendering of a note under
`/s/<short-id>`: the address to hand an
audience.

**Realtime channel** — the permanent
socket.io connection between each
editor's browser and the server,
carrying operations and a five-second
heartbeat.

**Revision** — a stored state in a
note's past, kept as patches in the
database and rebuildable into the
note's text at that moment.

**Session secret** — the instance's
`CMD_SESSION_SECRET`: the key that
signs sign-in cookies. Change it, and
every existing sign-in stops being
believed.

**Slide mode** — the `/p/<short-id>`
view, rendering a note as a slide
deck; a note becomes a deck with
`type: slide` in its front matter and
`---` lines between slides.

**SQLite** — the single-file database
this guide's instance uses: notes,
accounts, sessions and revisions in
one file on the disk.

**YAML metadata** — see *front matter*.
