import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelBuilder<T extends ChangeNotifier> extends StatefulWidget {
  const ViewModelBuilder({
    @required this.builder,
    @required this.viewModelBuilder,
    Key key,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);

  final Widget Function(BuildContext context, T model) builder;

  final Function(T model) onModelReady;

  final T Function() viewModelBuilder;

  final Function(T model) onDispose;

  @override
  State<ViewModelBuilder<T>> createState() => _ViewModelBuilderState<T>();
}

class _ViewModelBuilderState<T extends ChangeNotifier>
    extends State<ViewModelBuilder<T>> {
  T _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModelBuilder();
    if (widget.onModelReady != null && _viewModel != null) {
      widget.onModelReady(_viewModel);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null && _viewModel != null) {
      widget.onDispose(_viewModel);
    }
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<T>(
        create: (context) => _viewModel,
        child: widget.builder(
          context,
          _viewModel,
        ),
      );
}
