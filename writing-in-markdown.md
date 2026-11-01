# Writing in Markdown

**Outcome: you can write a pad that
reads well — headings, lists, tables,
code — and label it with front matter
so the server itself knows its name.**

## The plain text bargain

A HedgeDoc pad is written in
**Markdown**: ordinary text where a few
marks carry the formatting. A line
starting with `#` is a big heading,
`##` a smaller one; `**words**` are
bold, `*words*` italic; lines starting
with `- ` become a bulleted list; a
link is `[the words](the-address)`.
That is genuinely most of it, and it is
a bargain worth naming: the formatting
can never be trapped in the file,
because there is barely any formatting
*in* the file — chapter 4's download
proved a pad comes back as exactly the
text that went in.

The editor helps two ways. The toolbar
across the top wraps the marks around
whatever you have selected, for the
days your fingers forget them. And the
right-hand pane renders as you type, so
the pad teaches its own notation: type
a mark on the left, watch what it does
on the right.

## Beyond the basics

HedgeDoc's renderer (a Markdown engine
with extensions) takes the common
extras: tables drawn with pipes,
to-do lists (`- [ ]` and `- [x]`),
quoted blocks, fenced code blocks that
colour themselves by language, maths,
and simple diagrams written as text.
The project's own tour is one click
from every instance — the home page
links a **Features** note that
demonstrates each trick in a live pad —
and the note every new pad starts with
is the same tour in miniature. This
guide characterises rather than
re-lists them; the tour is better
teaching than any summary, because you
can edit it and watch.

## Front matter: the label on the pad

A note can carry its own paperwork. If
the very first lines of a pad sit
between two `---` fences, HedgeDoc
reads them as **YAML metadata** —
labelled facts about the note rather
than part of its text. The lab's second
note (transcript `t08`) opened:

```markdown
---
title: The Labelled Note
description: Front matter sets the title
tags: workshop, decisions
---

# Body heading
```

and the server's own JSON then reported
`"title":"The Labelled Note"` and that
description — the label won over the
body's first heading, which is where an
unlabelled note gets its name. The
project's metadata document lists the
full set of labels: `title`,
`description`, `tags`, `lang` and `dir`
for language and direction, `robots`
for whether search engines may index a
published page, `type: slide` to make
a note a slide deck (chapter 7), and
`slideOptions` for the deck's theme.
Labels are optional in every case; a
pad with none is named by its first
heading and described by its first
lines, as chapter 4's JSON showed.

## The check

Write a pad, label it, then ask the
server what it thinks the pad is
called:

```bash
curl http://127.0.0.1:18081/<note-name>/info
```

If the JSON answers with your label's
title, the machinery of this chapter —
text, marks, metadata — is working end
to end.
