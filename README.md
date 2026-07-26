# Tanya Plays Chess ♛

A small static website telling the story of Tanya — a 9-year-old chess player from
Old City, Philadelphia, member of the McCall School Chess Club.

## Files
- `index.html` — the page
- `styles.css` — styles
- `images/tanya.jpg` — Tanya's photo (add this file — see below)

## Add the photo
Save the "Queens Supporting Queens" photo as:

```
images/tanya.jpg
```

## Photo gallery — adding tournament photos

The "Photo gallery" section fills itself from the `images/gallery/` folder.

1. Drop `.jpg` / `.jpeg` files into `images/gallery/`.
2. Refresh the page — they appear automatically (carousel on top, thumbnails below).

Photos are shown in natural filename order, so name them like
`gallery-01.jpg`, `gallery-02.jpg`, … to control the order.

**Hosting note:** auto-pickup on refresh works when the site is served by
something that lists directories — e.g. the local `python3 -m http.server`
below, or Netlify. **GitHub Pages does *not* list directories**, so before
deploying there, regenerate the manifest the gallery falls back to:

```bash
./update-gallery.sh
```

Run that any time you add/remove gallery photos for a GitHub Pages deploy, then
commit the updated `images/gallery/manifest.json`.

## Run locally
Just open `index.html` in a browser, or serve the folder:

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000

## Deploy
Any static host works (GitHub Pages, Netlify, Vercel). For GitHub Pages, enable
Pages on the `main` branch in the repo settings.

## Support
The site links to Philadelphia After School Activities Partnerships (ASAP):
https://phillyasap.org/donate/
