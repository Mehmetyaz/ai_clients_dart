# Migration Guide

This guide covers breaking changes between major versions of `open_responses`.

For the complete list of changes, see [CHANGELOG.md](CHANGELOG.md).

---

## Migrating from v0.2.x to v0.3.0

v0.3.0 changes `InputFileContent.data()` to require a `mediaType` parameter for proper data URL construction.

### 1) `InputFileContent.data()` / `InputContent.fileData()` Signature Change

These factories now require a `mediaType` parameter and automatically construct the data URL format expected by the API.

```dart
// Before (v0.2.x)
InputFileContent.data(data: base64String)

// After (v0.3.0)
InputFileContent.data(data: base64String, mediaType: 'application/pdf')
```

---

## Migrating from v0.1.x to v0.2.0

v0.2.0 replaces the `ServiceTier` enum with an extensible class to align with the provider-agnostic OpenResponses specification.

### 1) `ServiceTier` Enum → Extensible Class

`ServiceTier` is now a class instead of an enum. This preserves provider-specific tier values on round-trip serialization instead of mapping unknown values to a lossy `unknown` fallback.

```dart
// Before (v0.1.x)
switch (tier) {
  case ServiceTier.auto: ...
  case ServiceTier.unknown: ...  // lossy — original value was lost
}

// After (v0.2.0)
if (tier == ServiceTier.auto) { ... }
// or switch with wildcard:
switch (tier) {
  case ServiceTier.auto: ...
  case _: print(tier.value); // preserves original string
}
```

Key changes:
- `ServiceTier.unknown` removed — unknown values are represented by their actual string
- `ServiceTier.values` no longer exists (enum-only API)
- `switch` on `ServiceTier` is no longer exhaustive — requires a wildcard `_` case
