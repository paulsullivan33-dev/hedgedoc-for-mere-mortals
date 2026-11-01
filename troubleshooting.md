# Troubleshooting

The failures this guide's lab actually
met, and the ones the configuration
makes likely, each with the check that
names it.

## The address answers 404

**Symptom:** a note address returns
"Not Found", though you are sure the
pad exists.

**What it usually is:** the address is
wrong, or the pad was never created.
HedgeDoc does not create a note when
you visit a fresh address — that
behaviour (*freeURL*) is **off** by
default, and the lab verified the off:
a made-up address answered 404
(transcript `t07`). New pads are born
at `/new`, and only there (or through
an account's pages). If your group
*wants* type-an-address-get-a-pad,
that is `CMD_ALLOW_FREEURL=true` —
switched on knowingly, because it also
means anyone can mint pads at any
address they can spell.

## Everyone was signed out overnight

**Symptom:** all accounts must log in
again, though passwords are unchanged.

**What it usually is:** the session
secret changed. `CMD_SESSION_SECRET`
signs the cookies that say *this
browser is signed in*; restart with a
different secret — or with none, in
which case the server invents a fresh
one at every start — and every old
cookie is a forgery. The cure is to
set one long secret in the
configuration and leave it there.

## A warning about TEXT in the log

**Symptom:** startup shows *"SQLite
does not support TEXT with options.
Plain TEXT will be used instead."*

**What it is:** harmless, and expected
with SQLite. The database layer writes
one dialect for several databases and
apologises where SQLite's is simpler.
The line that matters is the one after
the migrations: *HTTP Server listening*.
If that line is present, the warning
was weather, not damage.

## The home page loads but nothing saves, or links point at the wrong address

**Symptom:** redirects land on
`localhost` without your port, or the
editor half-loads.

**What it usually is:** `CMD_DOMAIN`
and `CMD_URL_ADDPORT` not matching how
browsers actually reach the server.
HedgeDoc *builds* the addresses it
redirects to from those settings — the
lab's `Location:` headers said
`http://localhost:18081/...` because
that is what it was told. Behind a
reverse proxy the same lesson applies
doubled: the instance must be told the
name and scheme the *public* uses.

## The build runs out of memory

**Symptom:** `yarn build` dies partway
on a small machine.

**What it usually is:** the frontend
build is the one heavy step — the
manual itself asks for 2 GB free. The
lab built on a shared 8 GB machine by
capping the build's own appetite
(`NODE_OPTIONS=--max-old-space-size=2048`)
and letting it take the 95 seconds it
took (transcript `t04`). If a machine
truly cannot build, the release
archive's prebuilt frontend (release
1.7 and later) is the documented way
past — install the dependencies for
running, and skip the build.

## A pad shows a title you did not expect

**Symptom:** the note is named after a
phrase you don't remember choosing.

**What it usually is:** naming is
derived, not asked. Without front
matter, the title is the note's first
heading and the description its first
lines — the lab's JSON in chapter 4
says so. With front matter, the label
wins (chapter 5). Neither is a bug;
both are the same rule: the document
names itself.
