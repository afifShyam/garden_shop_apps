import 'dart:developer';

import 'package:flutter/widgets.dart';

class RouteStack {
  static final List<String> _stack = [];

  static void push(String location) {
    if (_stack.isEmpty || _stack.last != location) {
      _stack.add(location);
      _logStack('PUSH', location);
    }
  }

  static void pop() {
    if (_stack.isNotEmpty) {
      final removed = _stack.removeLast();
      _logStack('POP', removed);
    }
  }

  static String? get previous => _stack.length > 1 ? _stack[_stack.length - 2] : null;

  static String? get current => _stack.isNotEmpty ? _stack.last : null;

  static bool get canPop => _stack.length > 1;

  static void _logStack(String action, String location) {
    // Print formatted stack to console
    log('🧭 ROUTE STACK [$action]: $location');
    log('📦 STACK: ${_stack.map((e) => '[$e]').join(' -> ')}\n');
  }
}

class RouteStackObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final name = route.settings.name ?? route.settings.arguments.toString();
    RouteStack.push(name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    RouteStack.pop();
  }
}
