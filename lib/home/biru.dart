import 'package:flutter/material.dart';

import 'centerdata.dart';

class Biru extends StatelessWidget {
  const Biru({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      color: Colors.blue,
      child: CenterData(),
    );
  }
}
