import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';
import 'merah.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter mycounter = BlocProvider.of<Counter>(context);
    // alternative lain
    // Counter mycounter = context.read<Counter>()
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEPENDCY INJECTION'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  // decrement
                  mycounter.decrement();
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Merah(),
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  // increment
                  mycounter.increment();
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
