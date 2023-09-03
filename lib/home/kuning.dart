import 'package:flutter/material.dart';

import 'biru.dart';

class Kuning extends StatelessWidget {
  const Kuning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      color: Colors.amber,
      child: Biru(),
    );
  }
}
