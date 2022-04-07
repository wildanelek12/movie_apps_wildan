import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_apps_wildan/helper/cubit_observer.dart';
import 'package:movie_apps_wildan/home_page.dart';

void main() {
  BlocOverrides.runZoned(
          () => runApp(const MyApp()),
          blocObserver: CubitObserver()
  );

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
