# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2025-01-13

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- [`music_kit` - `v1.2.1`](#music_kit---v121)

---

#### `music_kit` - `v1.2.1`

- **BUILD**(music_kit): add Swift Package Manager support.

## 2025-01-12

### Changes

---

Packages with breaking changes:

- MusicAuthorizationStatus is a sealed class now.

Packages with other changes:

- [`music_kit` - `v1.2.0`](#music_kit---v120)
- [`music_kit_platform_interface` - `v1.2.0`](#music_kit_platform_interface---v120)

---

#### `music_kit` - `v1.2.0`

- **REFACTOR**(music_kit): add empty `initialize` method in ios.
- **FIX**(music_kit): hide startScreen while startScreenMessage is null in android.
- **DOCS**: update example and readme.
- **DOCS**(music_kit): add additional notes for android.

#### `music_kit_platform_interface` - `v1.2.0`

- **REFACTOR**(music_kit_platform_interface): remove dependency on freezed.
  - BREAKING CHANGE: MusicAuthorizationStatus is a sealed class now.
