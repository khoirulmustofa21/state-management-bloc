import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/counter.dart';
import 'package:state_management_bloc/pages/text_widget.dart';

// BLOC PROVIDER

// ignore: slash_for_doc_comments
/** 
 * digungankan untuk depency injection
 * jadi ketika didalam sembuah induk widget memiliki banyak anak widget
 * maka untuk mengirimkan data tidak harus melembar data yang dari clas ke setiap widget anak.
 * 
 * penempatan BlocProvider harus pada parrentnya
 *  
*/

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLOC PROVIDER'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<Counter>(context).decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<Counter>(context).increment();
                },
                icon: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
