# Limits

What HedgeDoc cannot do, stated the
way chapter 1 of every guide in this
series insists on: plainly, and before
you depend on the opposite.

## One server, one room

HedgeDoc 1.x is a **single program**.
Every typist connects to the one
process; if it stops, every pad goes
quiet (the lab watched its own server
die and the pads with it, transcript
`t07`). There is no built-in clustering
or failover in the 1.x line — the
project's production advice is a
reverse proxy, a service manager and a
real database, which hardens the one
room but does not multiply it. For a
household, a club or a small team that
is the right size. For an organisation
that cannot have the pads go quiet, it
is the first fact to weigh.

## Permissions are levels, not lists

Chapter 7's six permissions divide the
world into *owner, signed-in, guest*.
There is no "this pad, for these four
named people" in 1.x — no per-person
sharing list, no groups. A pad is as
private as **Private** (owner only) or
as open as its level, and the middle
levels trust *anyone with an account
on the instance*, which on an instance
with open registration is close to
anyone at all. Match the tool to the
document: if the sharing rule you need
names people, HedgeDoc 1.x is not
shaped for that document.

## Size and shape caps

A note's length is capped —
**100,000 characters** by default
(`CMD_DOCUMENT_MAX_LENGTH`), roughly a
short book's worth, and a hard stop
rather than a warning. Pads are one
flat document each: no folders, no
sub-pages, no transclusion in 1.x;
organisation is by title, tags and
your own index pad. And a pad is
Markdown — the formatting ceiling of
chapter 5 is real. Documents that need
page layout, tracked changes in the
legal sense, or spreadsheet arithmetic
belong to other tools (chapter 11).

## The editor needs the network

There is no offline editing and no
desktop application in 1.x: no
connection, no pad — and a browser
mid-edit when the connection drops
holds text the server has not seen.
The document of record is the server's;
a pad is a service you attend, not a
file you carry. Chapter 9's downloads
are the compensation, and they are
manual.

## Identity is basic

Accounts are email-and-password (or an
external provider you configure). There
is no built-in two-factor
authentication in 1.x, and registration
is open unless you close it
(`CMD_ALLOW_EMAIL_REGISTER`). The admin
tooling is a command-line script
(`bin/manage_users`, listed in
transcript `t10`) rather than an admin
panel. On an internet-facing instance,
those three sentences are a security
posture to choose with open eyes.

## The 2.0 fact

HedgeDoc 2 is a ground-up rewrite, in
development, with its own architecture
and its own future. It is not an
upgrade this guide can walk you
through, and the 1.x line is what
"installing HedgeDoc" means today.
What you build on 1.x — pads, and the
Markdown they download as — is plain
text, and plain text is the migration
path that always exists.
