import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<Counter>(context),
      builder: (context, state) {
        return Text(
          "$state",
          style: const TextStyle(fontSize: 40),
        );
      },
    );
  }
}
