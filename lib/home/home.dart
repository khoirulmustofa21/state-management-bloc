import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/other/other.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // untuk melempar data dari page satu ke pagae dua disarankan mengguankan BlocProvider.value
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: mycounter,
                child: const OtherPage(),
              ),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
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
