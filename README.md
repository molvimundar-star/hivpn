# SadSha VPN

Free VPN client for Android and iOS, built with Flutter. One-tap OpenVPN connections
using public community servers from [VPN Gate](https://www.vpngate.net/) (University of
Tsukuba), plus an NDT7 speed test powered by Measurement Lab (M-Lab).

> Forked from [Mr-Dark-debug/hivpn](https://github.com/Mr-Dark-debug/hivpn)
> (Apache 2.0). Original `LICENSE` and attribution are untouched. This fork is
> maintained by **SadSha** as the SadSha VPN app — package `com.sadsha.hivpn`.

## Features

- **One-tap VPN** — connect to free public VPN Gate servers over OpenVPN.
- **Server browser** — live server list from the VPN Gate API, with search, country
  filter and sorting by speed / ping / sessions.
- **Session timer & notifications** — live session status, disconnect / extend
  actions from the notification and the Android quick-settings tile.
- **Speed test** — NDT7 (M-Lab) download / upload test with live gauge.
- **History** — past sessions with duration and data used.
- **Multi-language UI** — English, Spanish, Hindi and more (see `lib/l10n`).
- **No account, no sign-up** — servers are public and community-run.

## How it works

1. The app fetches the public server list from the VPN Gate API
   (`https://www.vpngate.net/api/iphone/`) and parses it into server entries.
2. Tapping a server downloads its OpenVPN config and starts an OpenVPN session
   (Android: `ics-openvpn` via the bundled service; iOS: Network Extension).
3. Speed tests run against M-Lab NDT7 servers.

There is **no SadSha VPN server backend** — the app is a client for public
VPN Gate servers. If VPN Gate is down or unreachable, the server list will be
empty and connections will fail. That is expected behaviour for a free client
of public servers, not a bug in this app.

## Build

```bash
flutter pub get
flutter run            # debug on a connected device
flutter build apk --release
```

Requirements: Flutter 3.13+ (see `pubspec.yaml`), Android SDK 34+ / Xcode 15+.

## Status / known limits

- **Not yet built or phone-tested from this fork.** No Flutter / Android SDK is
  available on the build VM, so the first `flutter build` + device test is still
  pending. The VPNGate API is also unreachable from the VM (network egress
  blocks `vpngate.net`), so live server loading could not be verified here —
  the wiring is complete in code (API → repository → server list → OpenVPN).
- **Protocol:** OpenVPN is the only working engine. WireGuard and IKEv2 are
  listed as "(coming soon)" — they have no engine in this codebase.
- **AdMob:** the app still ships with Google's test AdMob app ID
  (`ca-app-pub-3940256099942544~3347511713`). Replace it with a real AdMob app
  ID before any public release.
- **App icon:** still the upstream icon (`assets/icons/appicon.png`). Replace
  with a SadSha icon before release.
- **Support contact:** privacy / support emails currently point to
  `proadrank@gmail.com` — confirm or replace with a SadSha support address.

## Privacy

The app needs no account and stores no persistent identifiers. Speed tests send
network metrics and your IP to M-Lab (published for public research) — see the
in-app Privacy Policy. The full policy is in
`lib/features/settings/presentation/privacy_policy_content.dart`.

## License

Apache License 2.0 — see `LICENSE`. Copyright of the original code remains with
its authors; SadSha changes in this fork are under the same license.
