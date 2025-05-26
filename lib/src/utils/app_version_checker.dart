import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// A utility class to check app version and updates
class AppVersionChecker {
  /// Creates an app version checker
  AppVersionChecker();

  /// Get current app version
  Future<String> getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Get current build number
  Future<String> getBuildNumber() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  /// Get app name
  Future<String> getAppName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  /// Get package name
  Future<String> getPackageName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  /// Check if update is available
  Future<bool> isUpdateAvailable(String latestVersion) async {
    final currentVersion = await getCurrentVersion();
    return _compareVersions(currentVersion, latestVersion) < 0;
  }

  /// Compare two version strings
  int _compareVersions(String version1, String version2) {
    final v1Parts = version1.split('.');
    final v2Parts = version2.split('.');

    for (var i = 0; i < v1Parts.length && i < v2Parts.length; i++) {
      final v1 = int.tryParse(v1Parts[i]) ?? 0;
      final v2 = int.tryParse(v2Parts[i]) ?? 0;

      if (v1 < v2) return -1;
      if (v1 > v2) return 1;
    }

    if (v1Parts.length < v2Parts.length) return -1;
    if (v1Parts.length > v2Parts.length) return 1;

    return 0;
  }

  /// Open app store for update
  Future<bool> openAppStore(String appStoreUrl) async {
    final uri = Uri.parse(appStoreUrl);
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri);
    }
    return false;
  }

  /// Get full version info
  Future<AppVersionInfo> getVersionInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return AppVersionInfo(
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
    );
  }
}

/// App version information
class AppVersionInfo {
  /// Creates app version info
  const AppVersionInfo({
    required this.version,
    required this.buildNumber,
    required this.appName,
    required this.packageName,
  });

  /// App version
  final String version;

  /// Build number
  final String buildNumber;

  /// App name
  final String appName;

  /// Package name
  final String packageName;
} 