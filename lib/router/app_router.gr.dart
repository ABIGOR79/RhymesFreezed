// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:poem/ui/favorite/favorite_page.dart' as _i1;
import 'package:poem/ui/features/search_screen.dart' as _i4;
import 'package:poem/ui/history_page/history_screen.dart' as _i2;
import 'package:poem/ui/home/home_page.dart' as _i3;
import 'package:poem/ui/settings_page/settings_page.dart' as _i5;

/// generated route for
/// [_i1.FavoriteScreen]
class FavoriteRoute extends _i6.PageRouteInfo<void> {
  const FavoriteRoute({List<_i6.PageRouteInfo>? children})
    : super(FavoriteRoute.name, initialChildren: children);

  static const String name = 'FavoriteRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.FavoriteScreen();
    },
  );
}

/// generated route for
/// [_i2.HistoryScreen]
class HistoryRoute extends _i6.PageRouteInfo<void> {
  const HistoryRoute({List<_i6.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HistoryScreen();
    },
  );
}

/// generated route for
/// [_i3.MyHomePage]
class MyHomeRoute extends _i6.PageRouteInfo<void> {
  const MyHomeRoute({List<_i6.PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.MyHomePage();
    },
  );
}

/// generated route for
/// [_i4.SearchScreen]
class SearchRoute extends _i6.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i7.Key? key,
    required _i7.ThemeData theme,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         SearchRoute.name,
         args: SearchRouteArgs(key: key, theme: theme),
         initialChildren: children,
       );

  static const String name = 'SearchRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>();
      return _i4.SearchScreen(key: args.key, theme: args.theme);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key, required this.theme});

  final _i7.Key? key;

  final _i7.ThemeData theme;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, theme: $theme}';
  }
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsScreen();
    },
  );
}
