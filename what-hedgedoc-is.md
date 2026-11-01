# What HedgeDoc Is

You are in a meeting — at a table, or on
a call — and the group needs *one*
document: the list of decisions, the
shopping list for next week, the draft
announcement. The usual answers all have
a chore in them. A file emailed round
forks into five versions. A cloud
document needs everyone inside one
company's account system. A chat thread
scrolls the decision away.

**HedgeDoc is a pad on a server of your
own that the whole group types in at
once.** You run one program. It serves a
web page. Anyone you give the link to
opens that page and sees a document in
two halves: **Markdown** being typed on
the left — plain text with light
formatting marks — and the rendered,
readable page on the right. When one
person types, the others see the words
arrive, usually within a blink. There is
no save button, because there is nothing
to save: the server holds the document
and keeps it.

The program began life as the community
edition of HackMD, was renamed when the
community project went its own way, and
is now developed in the open as
HedgeDoc. This guide covers the stable
**1.x** line — the lab ran **1.12.0**.

## A first taste

With HedgeDoc installed (chapter 3), a
new pad is one visit:

```text
http://localhost:3000/new
```

The server makes a fresh note, gives it
a hard-to-guess address, and sends your
browser there. You type; the address is
the whole invitation. The same trick
works from the command line, which is
how this guide's lab made its first
note — posting a small Markdown file to
the server and following where it sent
us:

```bash
curl --data-binary @fixture-note.txt \
  -H "Content-Type: text/markdown" \
  http://127.0.0.1:18081/new
```

```text
HTTP/1.1 302 Found
Location: http://localhost:18081/rCdrQ52PSp-kpL6CvJ6pEw
```

That string at the end of the address
is the note's public name. Everything
in chapters 4 to 9 is a way of reading
or tending the document that lives
behind such an address.

## The link is the key — say it early

HedgeDoc's sharing model is the most
important thing in this guide, so it
stands here, in chapter 1, before any
procedure depends on it:

- A note's address is not a secret, but
  it is unguessable — and on a default
  instance, **anyone who has the link
  can read the note**.
- A note created by a guest is, by
  default, **editable by anyone with
  the link**. That is a deliberate
  choice by the project: a pad is meant
  to be passed around a table.
- Accounts and permission levels exist
  (chapter 7) and can tighten a note to
  named-in-effect groups — signed-in
  people, or only its owner. They are
  settings you choose, not the default
  state of a fresh pad.

So a HedgeDoc pad is a whiteboard, not
a safe. Whiteboards are wonderful —
for anything the group is happy to have
seen by whoever walks past. Passwords,
keys, recovery codes and private
records do not belong on one, and this
guide will not show you how to keep
them in HedgeDoc, because no setting
makes a link-shared document a secret
document.

## What it is not

HedgeDoc is not a word processor: there
are no fonts, page margins or track
changes in the office sense — the
formatting is Markdown's, deliberately
small (chapter 5). It is not a filing
system: it has history and search by
title, but no folders in the 1.x line —
the wiki-shaped tools in chapter 11
organise knowledge differently. It is
not a private notebook for one person
thinking alone, though nothing stops
you; its whole design leans toward
*other people arriving*. And it is not
the cloud documents it resembles: no
company hosts it, bills for it, or can
read over your shoulder — the
convenience and the responsibility both
live on your machine.

## Who it is for

The club secretary who wants the
meeting's decisions written down *while
they are being made*, by everyone who
was there. The workshop group keeping
one living shopping list and one page
of house rules. The small team drafting
announcements, agendas and how-tos
together without an account ceremony.
The teacher who wants a pad a class can
write on. The common thread is a group
with one document and no patience for
version five of the attachment — and
someone willing to run one small
program on a machine that stays on.
