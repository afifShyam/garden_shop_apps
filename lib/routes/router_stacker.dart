import 'dart:developer';
import 'package:flutter/widgets.dart';

class RouteStack {
  static final List<String> _stack = [];

  static void push(String location) {
    if (location.isEmpty || (_stack.isNotEmpty && _stack.last == location)) return;
    _stack.add(location);
    _log('PUSH', location);
  }

  static void replace(String location) {
    if (location.isEmpty) return;
    _stack
      ..clear()
      ..add(location);
    _log('REPLACE', location);
  }

  static void pop() {
    if (_stack.length > 1) {
      final removed = _stack.removeLast();
      _log('POP', removed);
    } else {
      _log('POP BLOCKED', 'Stack too shallow or empty');
    }
  }

  static String? get previous => _stack.length > 1 ? _stack[_stack.length - 2] : _stack.last;
  static String? get current => _stack.isNotEmpty ? _stack.last : null;
  static bool get canPop => _stack.length > 1;

  static void _log(String action, String location) {
    log('🧭 ROUTE STACK [$action]: $location');
    log('📦 STACK: $_stack');
  }
}

class RouteStackObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final name = _resolveName(route) ?? '/home';

    RouteStack.push(name);
  }

  String? _resolveName(Route<dynamic> route) {
    final name = route.settings.name;
    log(route.settings.name.toString(), name: 'name');
    if (name != null && name.isNotEmpty) return name;

    // final args = route.settings.arguments?.toString();
    // log(args.toString(), name: 'args');
    // if (args != null && args.isNotEmpty) return args;

    // Fallback for unnamed route (e.g., initial route)
    final uri = route.settings.name ?? ModalRoute.of(route.navigator!.context)?.settings.name;
    log(uri.toString(), name: 'uri');
    if (uri != null && uri.isNotEmpty) return uri;

    // Final fallback
    return '/home';
  }
}
