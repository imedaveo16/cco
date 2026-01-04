# DGPC Sovereign Mission-Control Platform (v1.0)

> **CLASSIFICATION**: SOVEREIGN / MISSION-CRITICAL / STATE SECRET
> **AUTHORITY**: Directorate General of Civil Protection (DGPC)

## Overview
This repository contains the source code for the Sovereign Command & Control (CCO) platform. It is designed as a high-availability, zero-trust system for national emergency coordination.

## Structure
- `/frontend`: Command Console (Flutter Web).
- `/backend`: Firebase Core (Rules, Functions, Indexes).
- `/docs`: Governance and Architectural Documentation.

## Governance
- **Push Policy**: Direct push to `main` restricted. Use PRs with `CODEOWNERS` approval.
- **Deployment**: Automated via GitHub Actions to Sovereign Hosting (Firebase).

## Getting Started
1. Install Flutter SDK.
2. Run `flutter pub get` in `/frontend`.
3. `flutter run -d chrome`.

## Security
- All commits are signed.
- Unifying Command Authority is enforced via Firestore Rules.
