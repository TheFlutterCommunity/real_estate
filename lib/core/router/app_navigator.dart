import 'package:go_router/go_router.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../main.dart';

final class AppNavigator {
  /// Check platform, for app, invoke push and for web, invoke go
  static push(String path) {
    if (kIsWeb) {
      navigatorKey.currentContext!.go(path);
    } else {
      navigatorKey.currentContext!.push(path);
    }
  }

  static pop() {
    navigatorKey.currentContext!.pop();
  }

  static List<String> getRoutes() {
    return [];
  }
}
