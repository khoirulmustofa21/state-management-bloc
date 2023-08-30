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

  int? current;
  int? next;
  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  // Observer
  // Boloc fitur untuk memantau perubahan data
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

class MyHome extends StatelessWidget {
  MyHome({super.key});
  CounterCubit mycounter = CounterCubit(initialData: 0);
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
              initialData: mycounter.initialData,
              stream: mycounter.stream,
              builder: (context, snapshot) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        '${snapshot.data}',
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Current : ${mycounter.current}',
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Next : ${mycounter.next}',
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                );
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
