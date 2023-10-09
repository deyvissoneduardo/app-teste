import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';

import 'hoopay_list_page.dart';

abstract class HoopayModules {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  HoopayModules({
    required Map<String, WidgetBuilder> routers,
    List<SingleChildWidget>? bindings,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => HoopayListPage(
          bindigns: _bindings,
          page: pageBuilder,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return HoopayListPage(
        page: widgetBuilder,
        bindigns: _bindings,
      );
    }
    throw Exception();
  }
}
