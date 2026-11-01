# Sharing and Permissions

**Outcome: you can choose, for each
pad, exactly who may read it and who
may write in it — and you know what an
account does and does not buy.**

Chapter 1 put the warning early; this
chapter is the working version of it.

## Guests and accounts

A fresh instance allows **guests**:
anyone who arrives can read pads and
make new ones, no ceremony. It also
allows **accounts** — on the lab's
instance, an email address and a
password, registered and signed in
through the home page. The lab did the
whole round trip without a browser,
the way chapter 4 made notes
(transcript `t08`): the register and
login forms answered, and the server
then introduced the account to itself:

```json
{"status":"ok","id":"fcccdc57-…",
 "name":"padkeeper","photo":"https://cdn.libravatar.org/avatar/…"}
```

Two honest details in that answer. The
name is the part of the email before
the `@` — accounts are plain. And the
photo comes from **Libravatar**, a
service the instance asks for a picture
to go with the account; it can be
switched off (`CMD_ALLOW_GRAVATAR=false`)
on an instance that should make no
such calls. An account's real powers
are three: its notes have an *owner*,
it can hold a note to a tighter
permission than a guest's pad can be
held to, and it appears in pads under
its own name. Sign-in through other
providers — the project supports
GitHub, GitLab, LDAP, OAuth2 and more
— is configured the same env-var way
and is documented-only here.

## The six permissions

Every note carries one permission,
changeable by its owner from the button
at the top of the editor. The project's
own table, which the defaults below
come from:

| Permission | Owner | Signed-in | Guests |
|---|---|---|---|
| **Freely** | read/write | read/write | read/write |
| **Editable** | read/write | read/write | read only |
| **Limited** | read/write | read only | no access |
| **Locked** | read/write | read only | read only |
| **Protected** | read/write | read only | no access |
| **Private** | read/write | no access | no access |

Read the table the mortal way: it is a
ladder of *who else is in the room*.
**Freely** is the whiteboard — and it
is the permission a **guest's** new
note is born with, which is chapter 1's
warning wearing its working clothes.
**Editable** keeps the public reading
but asks writers to sign in.
**Limited** and **Protected** pull the
curtain to signed-in readers.
**Private** is owner-only — the one
setting under which a pad is genuinely
not shared, though a pad someone has
already linked to others should be
treated as read by them whatever you
change later; permissions govern the
server's future answers, not memories
or copies.

Notes owned by an account are born at
the instance's `CMD_DEFAULT_PERMISSION`
— **Editable** unless you change it —
which is the single strongest reason to
run an instance with accounts for
anything beyond a meeting's scratchpad.

## The published view and slides

Sharing a pad to be *read* has its own
door, met in chapter 4: `/s/<shortname>`
renders the note as a clean page with
no editing furniture — the address to
hand an audience. `/p/<shortname>`
renders the same text as a **slide
deck**: write the pad as a sequence of
sections divided by `---` lines, label
it `type: slide` in its front matter,
and the one document is both the notes
and the presentation. The lab fetched
both views of its workshop note and
found its title in each (transcript
`t06`); the slide *authoring* craft —
themes and transitions live under
`slideOptions` — is the project's
documentation's, and its example deck
ships in every instance's docs.
