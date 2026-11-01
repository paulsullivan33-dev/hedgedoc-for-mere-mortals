# Many Hands — Editing Together

**Outcome: you understand what happens
when three people type in one pad at
once — why nobody's words eat anybody
else's, and what the people around the
document can see of each other.**

This chapter needs an honesty marker
before anything else, of the kind this
series keeps. The lab that wrote this
guide worked through one keyboard. It
opened the realtime channel and
recorded its handshake; it created,
read and re-read real notes. It did
**not** watch two cursors move in one
pad, because that takes two browsers
and two people. What follows about the
*experience* is the project's own
design, described — the machinery
underneath it is what the lab verified.

## Operations, not documents

The naive way to share a document —
send the whole text back and forth —
collapses the moment two people type
together: the last copy to arrive wins
and eats the other's sentence.
HedgeDoc instead shares **operations**.
When you type a word, your browser does
not send the document; it sends a small
instruction — *insert "agenda" at this
position* — up the permanent connection
from chapter 2. The server applies that
instruction to its own copy, stamps it
into the document's growing history,
and relays it to every other browser at
the pad, which applies it in turn.

Because every typist's instructions are
merged into *one* sequence by the
server, there is a single story of the
document that everyone is watching.
Two people can type in the same
paragraph at the same time; the words
interleave rather than collide. This
technique — operational transformation,
the same family of ideas behind the
first generation of collaborative
editors — is why a HedgeDoc pad has no
save button and no merge conflicts.
There is nothing to merge. There was
only ever one document.

## What the table looks like

Around the document, the editor shows
the gathering: who is present on the
pad, each person's cursor riding in a
colour with their name on it, so a
sentence arriving from across the table
is visibly *someone's*. Signed-in
people appear under their account
names; guests appear as guests, which
is itself information worth having
before a pad fills up (chapter 7).

Presence is also visible from outside
the editor. The `/status` answer the
lab kept collecting counts
`onlineUsers` and `onlineNotes` — the
server always knows how many hands are
on how many pads, because each is a
live connection with a five-second
heartbeat (transcript `t10`).

## When things wobble

A dropped connection is not a lost
document. The server's copy is the
document; a browser that falls off the
network and returns re-reads the
current state and rejoins the sequence.
The failure that does bite is subtler:
two people *rewriting the same sentence
at the same moment* will produce a
sentence that is grammatically nobody's
— the merging is faithful to
keystrokes, not to intentions.
Groups learn the social protocol in one
meeting: talk, point at the paragraph,
then type. The tool merges text; the
people still merge meaning.

And a pad is only live while the server
is. The lab stopped its server mid-work
and every pad went quiet — then started
it and found the notes untouched
(transcript `t07`). Collaboration is a
service, not a property of the file;
chapter 9 is about the file, which is
what remains when the service sleeps.
