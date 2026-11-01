# Pictures in Pads

**Outcome: you can put a picture into a
pad, and you know where the picture
itself goes to live — because it is not
in the pad.**

## The one experiment

A pad holds text. A picture is not
text, so HedgeDoc stores it beside the
notes and puts a *link* in the text.
The lab proved the whole loop with a
70-byte, one-pixel PNG (`hedgedoc-lab/
pixel.png`), sent to the same endpoint
the editor's image button uses:

```bash
curl -F "image=@pixel.png" \
  http://127.0.0.1:18081/uploadimage
```

```json
{"link":"http://localhost:18081/uploads/7b14be4f-….png"}
```

The editor drops that link into the pad
as Markdown image syntax. Fetching the
link back returned the picture with the
right type, and comparing the bytes
said it plainly: **uploaded and
downloaded bytes are identical**
(transcript `t09`). On disk, the
picture is an ordinary file in the
instance's `public/uploads/` folder,
wearing a long random name — which has
two consequences worth learning now
rather than later. The random name is
the picture's only lock: anyone with
the link can fetch it, like the pad
itself. And a backup that copies the
database but not the uploads folder is
a book of captions (chapter 9).

## Pasting, and who may

In the browser, pictures arrive the way
people actually work: paste from the
clipboard, drag a file in, or pick one
with the toolbar button — all three end
at the endpoint above. Who is allowed
to upload is an instance setting
(`CMD_ENABLE_UPLOADS`): everyone
including guests (the default when
guests can edit), signed-in people
only, or nobody. On an instance the
public can reach, that setting is the
difference between a scratchpad and a
free file host wearing your address —
chapter 12 counts it among the edges
to set deliberately.

## The other shelves

The filesystem folder is the default
**image backend**, not the only one:
the configuration offers S3-style
object storage, MinIO, Azure, and
external image hosts (Imgur, Lutim),
each with its own settings section.
Those exist for instances whose uploads
outgrow one disk or whose host is
ephemeral. The lab ran the default
only — the others are documented-only
here, characterised honestly: they
change where the bytes sleep, and
nothing about how a pad refers to
them.
