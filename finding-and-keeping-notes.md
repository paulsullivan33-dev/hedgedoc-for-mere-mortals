# Finding and Keeping Notes

**Outcome: a pad you made last month is
findable, its earlier selves are
reachable, and you know exactly what to
copy to back the whole instance up.**

## Finding: history, honestly described

HedgeDoc keeps a **history** — the list
of pads you have visited and made — on
the home page of the instance. There is
a wrinkle this guide states rather than
smooths over: the list is written by
the *browser*. It lives with your
browser's storage and is synced to the
server by the web page's own scripts.
The lab asked the history endpoint
directly, with its signed-in cookies,
and got an empty list back even after
creating notes (transcript `t08`) —
because the lab never ran the page's
JavaScript. Treat history as a
convenience of the browser you work in,
not as the instance's catalogue. The
instance's own truth is plainer: a
note's address, its title in the
database, and the `/status` count of
how many notes exist. Keep addresses
you care about somewhere you control —
a bookmark, a page in a wiki, another
pad.

## The revision time machine

What HedgeDoc *does* keep server-side,
carefully, is each note's past. As a
pad is edited, the server snapshots its
growth into **revisions** — stored as
patches, the differences between one
state and the next. The lab's first
note, written once and never edited,
had exactly one (transcript `t05`):

```bash
curl http://127.0.0.1:18081/<note-name>/revision
```

```json
{"revision":[{"time":1793503536937,"length":277}]}
```

and asking for that moment by its
timestamp returned the whole note as it
then stood — text, patch and authorship
information (transcript `t06`). In the
editor, the same history is a
point-and-click affair: open a note's
revision panel, pick a moment, read the
pad as it was, and restore it if the
present has gone wrong. Restore is a
browser act the lab describes rather
than ran; the reading of old revisions,
which is the part that must not be
faked, is proven above.

## Downloads are the exit

Every note can leave as it came: the
`/download` address from chapter 4
returns the raw Markdown, and the
editor offers the same as a file. A
folder of downloaded pads is a folder
of ordinary text files — readable in
fifty years, importable anywhere
Markdown is spoken. If you remember
one keeping-habit from this guide, make
it this: the pads you would grieve are
worth a periodic download, because
text you hold beats text you are
hosted.

## What a backup actually is

An instance is three things, and a
real backup copies all of them:

1. **The database** — for this guide's
   setup, the one SQLite file named by
   `CMD_DB_URL`. Stop the server, copy
   the file, and you hold every note,
   account and revision.
2. **The uploads folder** — the
   pictures of chapter 8, which the
   database only points at.
3. **The configuration** — the launch
   script or `config.json`, including
   the session secret, without which
   the restored instance still works but
   has signed everyone out.

The lab's whole estate after its
afternoon — three notes, one account,
one picture — was a 73 KB database
file and a 70-byte PNG. Restoring it
would be: unpack the release, put the
three things back, start the server.
Small is not a toy property here; it
is the property that makes keeping
your own notes honest work instead of
a project.
