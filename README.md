# HedgeDoc for Mere Mortals

Most shared writing lives on someone
else's computer: a document in a cloud
account, edited through a company's
website, under a company's rules.
**HedgeDoc** is the same idea with the
company left out. It is a program you
run on your own machine that serves
**pads** — Markdown documents that many
people can open in a browser and type
in *at the same time*, watching each
other's words appear as they land. No
account is needed to start, the notes
live in a small database on your disk,
and a note can be read as a tidy
published page, downloaded as plain
Markdown, or shown as slides.

One property deserves saying before any
procedure, because everything else in
this guide leans on it: **a HedgeDoc
pad is shared by its link.** Whoever
holds the link can open the pad, and on
a freshly installed instance a pad made
by a guest can be edited by anyone with
the link. That openness is what makes
HedgeDoc feel like magic in a meeting —
and it is why chapter 1 and chapter 7
treat permissions as a first-class
topic, and why no pad, on any instance,
is a place for passwords, keys or
anything you would not read aloud.

The lab behind this guide ran the real
thing: **HedgeDoc 1.12.0**, the official
release, built from its source archive
with the project's own Yarn build, on a
small Linux machine, configured entirely
through environment variables, storing
its notes in an **SQLite** file. Against
that running server the lab created
notes the way the web page does and the
way scripts do, read them back as
editor pages, published pages, slide
pages, JSON and raw Markdown, walked
the revision history, registered an
account and signed in, set a note's
title from its own front matter,
uploaded a picture and fetched it back
byte for byte, stopped the server dead,
started it again, and found every note
exactly where it had been left.

What the lab could not do, it did not
fake. It had one pair of hands, not two:
the sight of two people's cursors
moving in one pad at once — the very
heart of the tool — needs two browsers,
so chapter 6 explains the collaboration
machinery from the project's design and
from the live connection the lab did
open, and says plainly which part is
observed and which is described. Other
databases, other sign-in providers, and
putting HedgeDoc on the public internet
behind HTTPS are taught from the
documentation and labelled as such.
`criteria.md` keeps the full ledger.

## What this guide covers

- [**What HedgeDoc is**](what-hedgedoc-is.md) —
  the mental model: one document, many
  typists, a server of your own, and why
  the link *is* the key to the pad
- [**The moving parts**](the-moving-parts.md) —
  the Node program, the database, the
  browser editor, the realtime channel
  between them, and where pictures and
  history live
- [**Installing HedgeDoc**](installing-hedgedoc.md) —
  Node 20 or later, the release archive,
  the Yarn install and build, a first
  start on SQLite, and the checks that
  prove it is alive
- [**Your first pad**](your-first-pad.md) —
  making a note from the home page and
  from the command line, and reading it
  back four different ways
- [**Writing in Markdown**](writing-in-markdown.md) —
  the plain-text formatting HedgeDoc
  pads are written in, the extras it
  adds, and the front matter that names
  and describes a note
- [**Many hands — editing together**](many-hands.md) —
  how several typists share one document
  without overwriting each other, what
  the colours mean, and what happens
  when connections drop
- [**Sharing and permissions**](sharing-and-permissions.md) —
  accounts, the six permission levels,
  the published view, slide mode, and
  choosing who can do what
- [**Pictures in pads**](pictures-in-pads.md) —
  uploading an image into a note, where
  the file actually goes, and the other
  places pictures can live
- [**Finding and keeping notes**](finding-and-keeping-notes.md) —
  history, downloads, the revision time
  machine, and what a backup of the
  whole instance really is
- [**Recipes**](recipes.md) — the meeting
  pad, the read-only notice board,
  slides from a pad, and a small
  instance for a club or a household
- [**The neighbours**](the-neighbours.md) —
  Etherpad, HackMD, the cloud documents,
  and the wiki and notebook tools of
  this series: what each does that
  HedgeDoc doesn't, and vice versa
- [**Limits**](limits.md) — one server,
  a size cap on notes, permissions that
  are levels rather than lists of
  people, and the other edges stated
  plainly
- [**Troubleshooting**](troubleshooting.md) —
  the 404 that means a pad was never
  made, the sign-out that follows a
  changed secret, the harmless database
  warning, and the traps this guide's
  lab actually fell into
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

HedgeDoc 2 — the project's ground-up
rewrite — which is a separate program
still taking shape; this guide is about
the stable 1.x line throughout. Running
HedgeDoc at organisation scale, with
clusters, external identity providers
and dedicated database servers, is
pointed at rather than taught: the lab
ran one small instance the way a
household or a small club would. And
this guide will not help you keep
secrets in a pad — chapter 7 explains
why a pad is the wrong tool for that,
however it is configured.

## How to use this guide

Read chapter 1 for the model and
chapter 2 before installing anything —
knowing which part holds what turns
later confusion into a named problem.
Chapters 3 and 4 get you a running
server and a first pad in one sitting.
Chapter 6 is the one to read before you
invite anyone else in, and chapter 7
before you share a link you care about.
The lab's transcripts live in
`hedgedoc-lab/transcripts/`; its sample
pads are `hedgedoc-lab/fixture-note.txt`
and `hedgedoc-lab/fm-note.txt`, and the
script that started its server is
`hedgedoc-lab/run-server.sh`.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [BookStack for Mere Mortals](https://paulsullivan33-dev.github.io/bookstack-for-mere-mortals/)
- [Joplin for Mere Mortals](https://paulsullivan33-dev.github.io/joplin-for-mere-mortals/)
- [Obsidian for Mere Mortals](https://paulsullivan33-dev.github.io/obsidian-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/hedgedoc-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/hedgedoc-for-mere-mortals/blob/main/LICENSE-CODE).
