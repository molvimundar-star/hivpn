import 'package:sadsha_hivpn/core/utils/iterable_extensions.dart';

enum VpnProtocol { wireGuard, openVpn, ikev2 }

enum VpnDnsOption { cloudflare, google, custom }

extension VpnProtocolX on VpnProtocol {
  String get label {
    switch (this) {
      case VpnProtocol.wireGuard:
        return 'WireGuard (coming soon)';
      case VpnProtocol.openVpn:
        return 'OpenVPN';
      case VpnProtocol.ikev2:
        return 'IKEv2 (coming soon)';
    }
  }

  bool get isSupported => this == VpnProtocol.openVpn;
}

extension VpnDnsOptionX on VpnDnsOption {
  String get label {
    switch (this) {
      case VpnDnsOption.cloudflare:
        return 'Cloudflare (1.1.1.1)';
      case VpnDnsOption.google:
        return 'Google (8.8.8.8)';
      case VpnDnsOption.custom:
        return 'Custom DNS';
    }
  }
}

VpnProtocol protocolFromName(String? name) {
  return VpnProtocol.values.firstWhereOrNull((p) => p.name == name) ??
      VpnProtocol.openVpn;
}

VpnDnsOption dnsOptionFromName(String? name) {
  return VpnDnsOption.values.firstWhereOrNull((p) => p.name == name) ??
      VpnDnsOption.cloudflare;
}
