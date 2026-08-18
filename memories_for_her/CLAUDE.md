# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Flutter app (`memories_for_her`) — a personal gift built as a scrapbook for someone named Danna: a home message, a photo timeline, Spotify playlist links, a letter, and an International Women's Day tribute screen. All in-app copy is in Spanish. This is a personal/sentimental project, not a product — changes should preserve the tone and content of the existing text unless the user explicitly asks to change the message itself.

## Commands

Standard Flutter workflow (no custom scripts/Makefile):

```
flutter pub get                 # install dependencies
flutter run -d chrome           # run locally (web is the deployed target)
flutter run                     # run on a connected device/emulator
flutter analyze                 # static analysis (uses analysis_options.yaml + flutter_lints)
flutter test                    # run tests
flutter test test/widget_test.dart   # run a single test file
flutter build web                # production web build, outputs to build/web
```

Note: `test/widget_test.dart` is still the default Flutter counter-app template and does not match `MyApp`'s actual UI (it looks for a `+` icon and numeric counter that don't exist) — it will fail if run as-is. Treat it as unmigrated boilerplate rather than a spec of real behavior.

## Deployment

- Hosting is Firebase Hosting, project `memoriesforher-7d411` (`.firebaserc`), serving the Flutter web build.
- `firebase.json` serves `build/web` as a single-page app (all routes rewrite to `/index.html`).
- `.github/workflows/firebase-hosting-pull-request.yml` deploys a preview channel on PRs via `FirebaseExtended/action-hosting-deploy`. Note its build step (`run build`) is a placeholder from the Firebase CLI generator, not an actual Flutter build command — a real deploy needs `flutter build web` to run first.
- Deploy manually with `firebase deploy` after `flutter build web` if needed.

## Architecture

```
lib/
  main.dart              # MyApp + MainScreen shell (theme wiring, tab switching, nav bar)
  constants.dart         # AppColors, AppTexts, TimelineItem/PlaylistItem — all content & color tokens
  theme/
    app_theme.dart       # AppTheme.light() ThemeData + AppTheme.headingFont (Pacifico base style)
    app_motion.dart       # shared animation durations/curves (AppMotion.*)
  screens/                # one file per bottom-nav tab
    home_screen.dart
    timeline_screen.dart
    playlists_screen.dart
    letter_screen.dart
    women_day_screen.dart
  widgets/                # shared building blocks reused across screens
    decorative_header.dart   # gradient/border/shadow header shell
    section_title.dart       # icon(s) + Pacifico title + chip/subtitle
    decorative_accent_row.dart  # dot-line accent row + HeartDivider
    content_card.dart        # white/colored card + border + shadow
    shimmer_image.dart       # image with flutter_animate shimmer placeholder
    animated_nav_bar.dart    # AnimatedNavBar + NavBarItemData
    timeline_tile.dart       # timeline entry card (staggered entrance)
    playlist_card.dart       # playlist entry card (staggered entrance, opens Spotify)
```

- **`lib/constants.dart`** is the single source of truth for content and color tokens: `AppColors` (the blue palette — kept as the app's dominant identity; `women_day_screen.dart` intentionally overrides it with its own purple/gold accents, don't "fix" that), `AppTexts` (every string shown in the UI), and the two data models `TimelineItem` / `PlaylistItem`. **When asked to edit any visible text, color, add a memory/timeline entry, or add a song, edit this file** — not the screen widgets.
- **`lib/theme/app_theme.dart`** builds the real `ThemeData` (`ColorScheme` seeded from `AppColors.accentBlue`, `textTheme` via `google_fonts`). `AppTheme.headingFont` is the Pacifico base style — screens do `AppTheme.headingFont.copyWith(fontSize:, color:, ...)` rather than using a raw `fontFamily: 'Pacifico'` string literal (fonts are loaded at runtime via the `google_fonts` package, not bundled `.ttf` files or an HTML `<link>` tag — this works uniformly across web/Android/iOS/desktop).
- **`lib/theme/app_motion.dart`** holds shared animation timing (`AppMotion.fast/base/slow`, `.curve`, `.staggerStep`) — reuse these instead of introducing new magic-number durations when adding animations.
- Animations use the `flutter_animate` package (`.animate().fadeIn().slideY(...)` etc.) for entrance/staggered effects. The Women's Day rose/"Gracias" intro sequence in `women_day_screen.dart` is a deliberate exception — it stays a hand-rolled `AnimationController` because it drives a multi-stage sequenced overlay that doesn't map cleanly onto `flutter_animate`'s effect chaining; don't rewrite it "for consistency."

Key patterns to follow when extending this app:
- Screens are added as entries in `MainScreen._screens` in `main.dart` plus a matching `NavBarItemData` in `_navItems` and `AppTexts.nav*` label.
- Photo assets live in `assets/images/` and must be declared under `flutter: assets:` in `pubspec.yaml` (already globbed as `assets/images/`) — adding new files to that folder doesn't require a pubspec change, but referencing them does (`Image.asset('assets/images/...')`).
- Timeline entries are chronological `TimelineItem` objects in `AppTexts.timelineItems`; playlist entries are `PlaylistItem` objects (name, description, Spotify track URL, emoji) in `AppTexts.playlists`, opened via `url_launcher`.
- New headers/cards should reuse `DecorativeHeader`/`SectionTitle`/`ContentCard`/`DecorativeAccentRow` from `lib/widgets/` rather than hand-rolling another gradient `Container` — that duplication is exactly what those widgets were extracted to eliminate.
- `ShimmerImage` provides the loading shimmer effect used for timeline photos — reuse it for any new image display rather than a raw `Image.asset`.
