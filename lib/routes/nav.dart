import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'router_stacker.dart';

class Nav {
  static void go(BuildContext context, String location) {
    context.go(location);
    RouteStack.replace(location);
  }

  static void push(BuildContext context, String location, {Object? extra}) {
    context.push(location, extra: extra);
    RouteStack.push(location);
  }

  static void pop(BuildContext context) {
    if (RouteStack.canPop) {
      RouteStack.pop();
      context.pop();
    } else {}
  }

  static void product(BuildContext context, String id, {Map<String, String>? data}) {
    push(context, '/product/$id', extra: data ?? {});
  }

  static void home(BuildContext context) => go(context, '/home');
  static void mall(BuildContext context) => go(context, '/mall');
  static void discover(BuildContext context) => go(context, '/discover');
  static void inbox(BuildContext context) => go(context, '/inbox');
  static void account(BuildContext context) => go(context, '/account');
}
