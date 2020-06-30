import 'package:CoffeShopApp/pages/home/bloc/home_bloc.dart';
import 'package:CoffeShopApp/pages/home/home_page.dart';
import 'package:CoffeShopApp/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<HomeBloc>(
        create: (context)=> HomeBloc(Repository())..add(AppStarted()),
        child: HomePage(),
        ),
    );
  }
}
