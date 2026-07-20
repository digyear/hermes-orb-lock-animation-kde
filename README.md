# Hermes Orb Animation for KDE Plasma 6

![Animated preview](store-assets/preview.gif)

An unofficial KDE Plasma 6 animated wallpaper plugin based on the rotating orb illustration shown near the bottom of the official Hermes Agent website. It can be selected independently for the Plasma desktop or KDE lock screen.

## Preview

![Lock-screen preview on a 16:9 canvas](store-assets/preview.png)

## Features

- faithful electric-blue and white Hermes website styling;
- the full illustration is displayed at a maximum height of 338 pixels, matching the combined Parrot + Hermes theme;
- 1284×1590 software-decoded source animation;
- seamless 2.8-second loop;
- self-contained package with no network requests after installation;
- avoids GPU video-decoder artifacts by using Qt Quick `AnimatedImage` playback.

## Requirements

- KDE Plasma 6.0 or later.

## Install

```bash
./build.sh
kpackagetool6 --type Plasma/Wallpaper --install dist/hermes-orb-animation-1.0.2.plasmoid
```

To select it directly for the lock screen:

```bash
kwriteconfig6 --file kscreenlockerrc --group Greeter --key WallpaperPlugin io.github.digyear.hermesorb
kbuildsycoca6
```

Test without locking the session:

```bash
/usr/lib/x86_64-linux-gnu/libexec/kscreenlocker_greet --testing
```

Uninstall:

```bash
kpackagetool6 --type Plasma/Wallpaper --remove io.github.digyear.hermesorb
```

## Source and licensing

The Plasma integration code is GPL-3.0-or-later. The original animation is sourced from the official Hermes Agent website and attributed to Nous Research. See [`CREDITS.md`](CREDITS.md) for the artwork licensing caveat. This package should remain local until the animation's redistribution terms are confirmed.

This is an unofficial community adaptation and is not an official Nous Research or KDE product.
