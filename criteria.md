# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's pads are stock documents about a fictional
   workshop, and its account is an invented one at example.com.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 12 names what the tool
   cannot do: one single server process with no clustering,
   permissions that are levels (owner / signed-in / guest)
   rather than lists of named people, a 100,000-character
   default cap on a note's length, no folders or sub-pages,
   an editor that needs a live connection and JavaScript,
   basic built-in identity (no two-factor in 1.x, open
   registration unless closed), and a ground-up rewrite
   (HedgeDoc 2) that this guide does not teach.
8. **The ethics rule is in the text, early.** HedgeDoc's line
   is sharing itself, and the README and chapter 1 state it
   before any procedure depends on it: a pad is shared by its
   link, a guest's new pad is editable by anyone holding that
   link, and uploaded pictures are fetchable by anyone
   holding theirs — so pads are for what a group is happy to
   have seen, never for passwords, keys or private records,
   and chapter 7 teaches the permission ladder that tightens
   a pad when openness is wrong.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is a 2-CPU, 7.7 GB Ubuntu 24.04 sandbox,
shared with other work while the lab ran (timings are therefore
ranges, and the guide says so). HedgeDoc **1.12.0** was
installed from the official release archive
`hedgedoc-1.12.0.tar.gz` (SHA-256 recorded in transcript t00).
The machine's bare Node 24 binary had no corepack beside it,
so the official Node **v22.23.4** tarball from nodejs.org —
inside the project's documented "Node 20 or later" range —
was unpacked into the lab folder and used throughout (t02).
Yarn **4.13.0** (the version the release pins) installed the
dependencies (t03), the SQLite driver compiled and loaded,
and the project's webpack build completed in about 95 seconds
with its memory capped at 2 GB (t04). The server ran in
production mode on 127.0.0.1, port 18081, configured only by
environment variables, with its SQLite database in the lab
folder. All transcripts live in `hedgedoc-lab/transcripts/`;
the launch script is `hedgedoc-lab/run-server.sh` and the
fixture pads are `hedgedoc-lab/fixture-note.txt` and
`hedgedoc-lab/fm-note.txt`.

Run for real, with transcripts as evidence:

- Home page (HTTP 200, the project's title) and the `/status`
  JSON of a fresh instance (t05).
- Note creation both ways: GET /new (empty note, redirect to
  its address) and POST /new with a Markdown file as the body
  (302 to the note's address) (t05, t07).
- The note read back four ways: editor page (200, title taken
  from its first heading), `/info` JSON, `/download` returning
  the posted Markdown byte for byte, and the published `/s/`
  and slide `/p/` views under its short ID (t05, t06).
- The database opened directly: the Notes row (UUID, short ID
  `LFLUzUABt4`, derived title, 277 characters) and the table
  list of a live instance (t06).
- Revisions: the list endpoint (one revision, length 277) and
  fetching that revision whole — text, patch and authorship
  (t06).
- Failure and persistence: a never-created address answering
  404 with freeURL off; the server killed and restarted, the
  note downloaded again and diffed **identical** to the file
  that was posted, `/status` counting all three notes (t07).
- Accounts: registration and login by form POST (302s), the
  `/me` JSON for the signed-in account, a signed-in note whose
  `/info` took its title and description from YAML front
  matter rather than its body (t08).
- An image uploaded through the editor's endpoint and fetched
  back byte-identical, its file found in `public/uploads/`
  (t09).
- The realtime channel's socket.io handshake (session id,
  websocket upgrade offered, 5-second heartbeat) and the
  release's admin scripts listed; final `/status` counting
  3 notes and 1 registered user before shutdown (t10).

Documented only — described from the project's documentation,
not run, and the text does not claim otherwise:

- **Two people typing in one pad at once.** The lab had one
  client. Chapter 6 explains the operation-merging design
  from the project's architecture and the channel the lab did
  open; the sight of two cursors moving together, presence
  colours in use, and a mid-edit disconnect rejoining are
  described, not observed.
- Browser-side acts: editing in the page, the revision
  panel's restore button, changing a note's permission from
  the editor button, drag-and-drop image adding, and the
  history list (the lab confirmed its endpoint answers and
  that the list is written by the browser's scripts — its
  own direct query returned empty).
- Slide *authoring* (themes and transitions under
  `slideOptions`) beyond the `/p/` view answering for a note;
  the project's bundled slide example is the reference.
- PostgreSQL and MySQL/MariaDB databases; sign-in providers
  other than local email (GitHub, GitLab, LDAP, OAuth2 and
  the rest); image backends other than the filesystem
  (S3, MinIO, Azure, Imgur, Lutim); `bin/manage_users` and
  the other admin scripts (listed, not run); HTTPS and
  reverse-proxy deployment; running under a service manager;
  the container image and `bin/setup` install paths.
- HedgeDoc 2, the rewrite — mentioned only to say it is a
  different program this guide does not teach.

Fixtures are this guide's own and deliberately generic: a
workshop pad with a shopping list, a front-matter test note,
a one-pixel PNG, and an invented account at example.com. No
real names, organisations, networks or events appear in them.
The two pads are shipped in `hedgedoc-lab/` as `.txt` files so
the site builder does not mistake them for guide pages; their
content is byte-identical to the `.md` files the lab posted,
which is the name the transcripts record.
