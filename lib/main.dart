import 'package:explosive_harry_potter/caracteristicas/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Aplicacion());
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      BlocPotter bloc = BlocPotter();
      Future.delayed(const Duration(seconds: 2), (){
        bloc.add(Creado());
      });
      return bloc;
    },
    child: const SelectorVista(),);
  }
}

class SelectorVista extends StatelessWidget {
  const SelectorVista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Harry Potter API"),),
        body: Builder(builder: (context){
          return const Center(child: Text("No implementado..."),);
        }),
      ),
    );
  }
}