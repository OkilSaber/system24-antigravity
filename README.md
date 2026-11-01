# system24 for antigravity ide

A port of [refact0r's system24](https://github.com/refact0r/system24) Discord theme to Antigravity IDE (should also work in VS Code and other forks).

Two parts:

- **color themes** (a regular extension): `system24` (grey and purple), `system24 bloodmoon` (BloodMoon colors from the spicetify [text](https://github.com/spicetify/spicetify-themes/tree/master/text) theme) and `system24 bloodmoon light`
- **`system24.css`**: the tui look a color theme can't do — gaps between panels, 2px borders that light up on hover, panel labels on the borders, DM Mono in the UI, square corners. It needs the [Custom UI Style](https://open-vsx.org/extension/subframe7536/custom-ui-style) extension, which patches the app's files.

The palettes are tuned for astigmatism: no pure black or pure white background, body text around 13:1 instead of 17:1, dim text (comments, line numbers) at 5:1 or more, desaturated syntax colors, no italics.

## Install

Color themes: search for **system24** in the Extensions view (published on [Open VSX](https://open-vsx.org/extension/OkilSaber/system24)), or build it yourself:

```bash
./pack.sh
antigravity-ide --install-extension system24.vsix
```

`pack.sh` runs `build.mjs` (which generates `themes/*.json` from the palettes) and zips the extension by hand.

Custom CSS: install [Custom UI Style](https://open-vsx.org/extension/subframe7536/custom-ui-style), then in `settings.json`:

```jsonc
"custom-ui-style.external.imports": [
    { "type": "css", "url": "https://fonts.googleapis.com/css2?family=DM+Mono:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" },
    { "type": "css", "url": "https://raw.githubusercontent.com/OkilSaber/system24-antigravity/main/system24.css" }
],
```

and run **Custom UI Style: Reload** from the command palette. Each reload fetches the latest `system24.css` from this repo; run it again after every app update. **Custom UI Style: Rollback** restores the original files.

To tweak the CSS locally instead, copy `system24.css` somewhere and use `"file://${userHome}/path/to/system24.css"` in place of the GitHub url.

## Follow the macOS appearance

```jsonc
"window.autoDetectColorScheme": true,
"workbench.preferredDarkColorTheme": "system24 bloodmoon",
"workbench.preferredLightColorTheme": "system24 bloodmoon light",
```

## Customize

Colors live in the `schemes` object at the top of `build.mjs`; run `./pack.sh` and reinstall after editing.

## Publish

Bump `version` in `package.json`, then:

```bash
./pack.sh && npx ovsx publish system24.vsix -p <token>
```

## Credits

[system24](https://github.com/refact0r/system24) by refact0r, MIT.
