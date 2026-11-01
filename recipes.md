# Recipes

Four ways a small instance earns its
keep. Each is assembled from parts the
earlier chapters verified; steps that
live in the browser are described as
such, and nothing here needs a part
this guide hasn't shown working.

## The meeting pad

*One pad per meeting, written by the
meeting itself.*

1. Before the meeting, make a pad (the
   home page's New button, or the
   chapter 4 posting door) and put the
   agenda in it as headings: *Present*,
   *Decisions*, *Actions*, *Shopping
   list*.
2. Put the pad's address in the meeting
   invitation. Guests can write by
   default — that is the point.
3. During the meeting, decisions are
   typed where they fall, by whoever
   heard them best. Chapter 6's rule
   applies: talk, point, then type.
4. Afterward, the owner (sign the pad
   in under an account if it matters)
   sets the permission to **Locked**, so
   the record stops drifting, and
   downloads a copy for the files.

The lab's fixture note is exactly this
shape — a workshop's decisions and
shopping list — and it survived a
server restart untouched, which is the
whole promise (transcript `t07`).

## The notice board

*A page the public may read and only
you may write.*

1. Create the pad under your account
   and write the notice: the hall's
   hours, the club's next events, the
   house rules.
2. Set its permission to **Locked** or
   **Protected** — the public (or the
   signed-in) read; only you write.
3. Share the **published address**,
   `/s/<shortname>`, not the editor
   address. It renders clean, it carries
   no editing furniture, and its front
   matter can carry `robots: noindex`
   if you would rather search engines
   left it alone.

## Slides from a pad

*One document that is both the talk
and the handout.*

1. Write the pad as sections separated
   by lines of `---`, one section per
   slide, big heading first.
2. Add front matter (chapter 5):
   `type: slide`, a title, and a theme
   under `slideOptions` if you like.
3. Present from `/p/<shortname>`;
   hand out `/s/<shortname>` after —
   the audience's copy has the words
   without the slide breaks being the
   point.

The lab confirmed both addresses
answer for a note (transcript `t06`);
the deck-craft itself — themes,
transitions — is the project's slide
example, which ships in the instance's
own docs and is better shown live.

## The scripted notice

*A pad maintained by a program, not a
person.*

The posting door of chapter 4 is an
API in everything but name: any script
that can send an HTTP POST can create a
pad with today's content in it — the
day's readings, the build results, the
rota. Keep the returned address (the
script owns the pad it made; append
`/download` when the script needs the
text back, and `/info` when it needs
the title). Rate limits on new-note
creation exist in the configuration for
instances the public can reach; on a
household instance the lab's pattern —
a file in, a `Location` header out —
is the whole integration.
