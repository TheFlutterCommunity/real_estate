import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../ui/views/index.dart';

GoRouter getRouter() => GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return DashboardView(key: UniqueKey());
          },

          /// Contains multiple routes
          routes: const [],
        ),
      ],
    );
