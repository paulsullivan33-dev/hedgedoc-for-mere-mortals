# Your First Pad

**Outcome: one note created, then read
back four ways — editor, published
page, JSON and raw Markdown — so you
know the thing you made is really in
there.** Everything below ran against
the lab's server on port 18081; your
own will differ only in the port.

## Making the pad

In a browser, the home page's **New**
button (or a visit to `/new`) creates
an empty note and lands you in its
editor. The note starts life filled
with the project's starter template —
a tour of what a pad can do — and its
address is already its invitation.

From the command line there are two
doors. An empty note, the same as the
button:

```bash
curl -i http://127.0.0.1:18081/new
```

and a note with something already in
it — post a Markdown file as the body,
and the server creates the note around
it. This is how the lab made its first
pad, from `hedgedoc-lab/fixture-note.txt`,
a stock little document about a
workshop's shopping list:

```text
HTTP/1.1 302 Found
Location: http://localhost:18081/rCdrQ52PSp-kpL6CvJ6pEw
```

Both doors answer with a **redirect**:
the server is saying *your note exists,
and here is its name*. Scripts on the
internet — including, in chapter 10, a
backup recipe — use the posting door
constantly; it is also the quickest
honest test that a fresh install works,
because nothing about it can be faked
by a pretty home page.

## Reading it back, four ways

The note's name opens the **editor** —
for the lab's note, a 42 KB page titled
*Saturday Workshop Notes – HedgeDoc*,
the title taken from the note's own
first heading. The other three views
are the same document wearing different
clothes, all proven in transcript `t05`
and `t06`:

**The data about the note**, as JSON —
append `/info`:

```json
{"title":"Saturday Workshop Notes",
 "description":"# Saturday Workshop Notes  A pad anyone…",
 "viewcount":0,"createtime":"2026-11-01T03:25:36.857Z",
 "updatetime":null}
```

**The note itself, as Markdown** —
append `/download`, and what comes back
is byte-for-byte the file that was
posted: headings, list, bold marks and
all. That endpoint is the note's escape
hatch: whatever else HedgeDoc ever
does, a pad is always retrievable as
plain text.

**The published page** — the reading
view, for people who should see the
finished document rather than the
workings. It lives under `/s/` with the
note's *short* name (the database row
in chapter 2 held it: `LFLUzUABt4`):

```text
http://localhost:18081/s/LFLUzUABt4
```

A tidy rendered page, no editor in
sight. Its close cousin `/p/` shows the
same note as **slides** (chapter 7) —
both answered the lab with the note's
title in place.

## The check

The four views agree because they are
four readings of one stored text. If
you want a fifth, sterner witness: the
server's own counter. After the lab had
made its notes, `/status` reported
`"notesCount":3` — and when the server
was killed and restarted, the lab
downloaded its first note again and
diffed it against the file it had
posted: **identical** (transcript
`t07`). A pad is not a browser trick.
It is a row in a database, and it
survives the program that serves it.
