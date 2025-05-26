import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

/// A utility class to check network connectivity
class ConnectivityChecker {
  /// Creates a connectivity checker
  ConnectivityChecker() {
    _initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatusList);
  }

  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityStatus> _statusController = StreamController<ConnectivityStatus>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  ConnectivityStatus _currentStatus = ConnectivityStatus.unknown;

  /// Stream of connectivity status changes
  Stream<ConnectivityStatus> get onConnectivityChanged => _statusController.stream;

  /// Current connectivity status
  ConnectivityStatus get currentStatus => _currentStatus;

  /// Initialize connectivity checking
  Future<void> _initConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatusList(results);
    } catch (e) {
      _updateConnectionStatus(ConnectivityResult.none);
    }
  }

  /// Update the connection status from a list
  void _updateConnectionStatusList(List<ConnectivityResult> results) {
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    _updateConnectionStatus(result);
  }

  /// Update the connection status
  void _updateConnectionStatus(ConnectivityResult result) {
    final newStatus = _getConnectivityStatus(result);
    if (newStatus != _currentStatus) {
      _currentStatus = newStatus;
      _statusController.add(newStatus);
    }
  }

  /// Get connectivity status from result
  ConnectivityStatus _getConnectivityStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wifi;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.mobile;
      case ConnectivityResult.ethernet:
        return ConnectivityStatus.ethernet;
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.bluetooth;
      case ConnectivityResult.vpn:
        return ConnectivityStatus.vpn;
      case ConnectivityResult.other:
        return ConnectivityStatus.other;
      case ConnectivityResult.none:
        return ConnectivityStatus.none;
    }
  }

  /// Check if device is connected to internet
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.isNotEmpty && results.first != ConnectivityResult.none;
  }

  /// Dispose the connectivity checker
  void dispose() {
    _connectivitySubscription?.cancel();
    _statusController.close();
  }
}

/// Connectivity status types
enum ConnectivityStatus {
  /// No internet connection
  none,

  /// Connected to WiFi
  wifi,

  /// Connected to mobile data
  mobile,

  /// Connected to ethernet
  ethernet,

  /// Connected to bluetooth
  bluetooth,

  /// Connected to VPN
  vpn,

  /// Connected to other network
  other,

  /// Unknown connection status
  unknown,
} 