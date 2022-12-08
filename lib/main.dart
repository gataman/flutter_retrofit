import 'package:api_project/view/home/home_view.dart';
import 'package:api_project/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/home/cubit/home_cubit.dart';

void main() async {
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()..getTodoList(),
        child: HomeView(),
      ),
    );
  }
}
