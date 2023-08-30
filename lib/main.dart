import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CUBIT APPS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHome(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);
  int initialData;
  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}

class MyHome extends StatelessWidget {
  MyHome({super.key});
  CounterCubit mycounter = CounterCubit(initialData: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUBIT APPS'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: mycounter.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text(
                      'Loding...',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      '${snapshot.data}',
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  );
                }
              }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  mycounter.tambahData();
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  mycounter.kurangData();
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
