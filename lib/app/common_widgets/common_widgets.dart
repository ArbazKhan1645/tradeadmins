// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';

class OneTimeFutureBuilder<T> extends StatefulWidget {
  final Future<T> Function() futureFunction;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)
      builder;

  const OneTimeFutureBuilder({
    required this.futureFunction,
    required this.builder,
    super.key,
  });

  @override
  _OneTimeFutureBuilderState<T> createState() =>
      _OneTimeFutureBuilderState<T>();
}

class _OneTimeFutureBuilderState<T> extends State<OneTimeFutureBuilder<T>>
    with AutomaticKeepAliveClientMixin {
  late Future<T> _future;
  late T _data;

  @override
  void initState() {
    super.initState();
    _future = widget.futureFunction();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<T>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            _data = snapshot.data as T;
            return widget.builder(context, snapshot);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
        }
        return const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class OneTimeStreamBuilder<T> extends StatefulWidget {
  final Stream<T> Function() streamFunction;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)
      builder;

  const OneTimeStreamBuilder({
    required this.streamFunction,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _OneTimeStreamBuilderState<T> createState() =>
      _OneTimeStreamBuilderState<T>();
}

class _OneTimeStreamBuilderState<T> extends State<OneTimeStreamBuilder<T>>
    with AutomaticKeepAliveClientMixin {
  late Stream<T> _stream;
  late T _data;

  @override
  void initState() {
    super.initState();
    _stream = widget.streamFunction();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<T>(
      stream: _stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            _data = snapshot.data as T;
            return widget.builder(context, snapshot);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
        }
        return const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
