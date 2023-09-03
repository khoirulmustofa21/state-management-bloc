import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Counter mycounter = BlocProvider.of<Counter>(context);
    return BlocBuilder(
        bloc: mycounter,
        builder: (context, state) {
          return Text(
            "$state",
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          );
        });
  }
}
