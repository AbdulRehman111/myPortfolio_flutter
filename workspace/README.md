# Abdul Rehman — Professional Portfolio

Flutter Web portfolio for Abdul Rehman, Software Engineer.

**Software Engineer | Full Stack Developer | Core Mobile Application Developer | Flutter Developer**

Building reliable mobile, web, and backend solutions from idea to production.

## Confirmed data policy

LinkedIn could not be scraped at build time. The site is populated only with:

- Name, headline, tagline and 9+ years of experience from the brief
- Confirmed employer: Fujairah Municipality (title, dates and detailed responsibilities remain marked pending verification)
- Public LinkedIn URL: https://www.linkedin.com/in/abdul-rehman-1602
- Skills and expertise areas listed in the brief

Projects, certifications, awards, education, published apps, email, phone, GitHub and store URLs are **configurable placeholders**. They are labelled in the UI. Do not treat them as live credentials.

## Configure content

Edit `lib/data/portfolio_data.dart` only. UI code reads from that file.

Replace placeholder images under `assets/images/` and the CV at `assets/documents/cv.pdf` (also copied to `web/cv.pdf`).

## Run

```bash
flutter pub get
flutter run -d chrome
```

Web release:

```bash
flutter build web --release --web-renderer canvaskit
```

## Languages

English (LTR) and Arabic (RTL). Switcher persists via `shared_preferences`.
ARB files live in `lib/l10n/`.

## Architecture

`lib/app` `lib/models` `lib/data` `lib/screens` `lib/sections` `lib/widgets` `lib/services` `lib/l10n` `lib/theme` `lib/utils`
