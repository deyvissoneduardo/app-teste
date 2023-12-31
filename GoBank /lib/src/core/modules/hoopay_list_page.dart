import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HoopayListPage extends StatelessWidget {
  final List<SingleChildWidget>? _bindigns;
  final WidgetBuilder _page;

  const HoopayListPage({
    Key? key,
    required WidgetBuilder page,
    List<SingleChildWidget>? bindigns,
  })  : _bindigns = bindigns,
        _page = page,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _bindigns ??
          [
            Provider(
              create: (_) => Object(),
            ),
          ],
      child: Builder(
        builder: (context) => _page(context),
      ),
    );
  }
}
