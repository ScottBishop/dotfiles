# Personal Claude Configuration

## Model Routing

- **Planning** (`/plan` mode) → Opus (handled automatically by `opusplan` model setting)
- **Implementation** → Sonnet (handled automatically by `opusplan` model setting)
- **Queries / read-only searches** → Use `model: "haiku"` when spawning `Explore` agents for code searches, file lookups, and simple factual lookups. For quick one-off query sessions, use `/model haiku` and switch back when done.

## Identity

- Name: Scott Bishop
- Email: scott.bishop@servicenow.com
- Company: ServiceNow

## Project Locations

| Project | Path |
|---|---|
| iOS mobile client | `~/Code/servicenow/ios/mobilesky` |
| Android mobile client | `~/Code/servicenow/android/mobilesky-android-app` |
| UI test suite | `~/Code/servicenow/glide-test/app-sg*` |
| Mobile backend | `~/Code/servicenow/glide/glide-sg` |

## Branching Conventions

### iOS & Android (`mobilesky`, `mobilesky-android-app`)

- **`develop`** — main integration branch; all new code and PRs target this branch
- **`mobile-release`** — release branch for code going to app stores; do not open PRs here unless explicitly asked
- Before opening a PR, always pull the latest `develop` into the scratch branch

### Glide / Backend (`glide-test`, `glide-sg`)

- **`track/skymobile`** — the integration branch; all PRs target this branch
- Before opening a PR, always pull the latest `track/skymobile` into the scratch branch

### Scratch Branch Format

All working branches follow this naming convention:

```
scratch/sd/scott-bishop/<TICKET>-<short-description>
```

Examples:
- `scratch/sd/scott-bishop/DEF0192300-fix-oauth-crash`
- `scratch/sd/scott-bishop/STRY0012345-add-catalog-filter`
