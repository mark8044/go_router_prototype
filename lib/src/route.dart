// Copyright 2022 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:quiver/core.dart';

import 'typedefs.dart';

class StackedRoute extends Route {
  final StackedRouteBuilder builder;

  StackedRoute({
    required String path,
    required this.builder,
    Redirect? redirect,
    List<Route> children = const [],
  }) : super(
          path: path,
          children: children,
          redirect: redirect,
        );
}

class ShellRoute extends Route {
  final ShellRouteBuilder builder;
  final String? defaultChild;

  ShellRoute({
    required String path,
    required this.builder,
    this.defaultChild,
    Redirect? redirect,
    List<Route> children = const [],
  }) : super(
          path: path,
          children: children,
          redirect: redirect,
        );
}

class NestedNavigatorRoute extends Route {
  final NestedNavigatorRouteBuilder builder;

  NestedNavigatorRoute({
    required String path,
    required this.builder,
    Redirect? redirect,
    List<Route> children = const [],
  }) : super(
          path: path,
          children: children,
          redirect: redirect,
        );
}

abstract class Route {
  static const _listEquality = ListEquality();

  final String path;
  final List<Route> children;
  final Redirect? redirect;

  const Route({
    required this.path,
    this.children = const [],
    this.redirect,
  });

  @override
  bool operator ==(Object other) =>
      other is Route &&
      other.path == path &&
      _listEquality.equals(other.children, children);

  @override
  int get hashCode => hash2(path, _listEquality.hash(children));

  @override
  String toString() => 'Route: $path';
}
