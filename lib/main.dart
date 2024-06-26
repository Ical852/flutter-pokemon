import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';
import 'package:flutterpokemon/screens/detail_pages/detail_page.dart';
import 'package:flutterpokemon/screens/main_pages/home_page.dart';
import 'package:flutterpokemon/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetPokemonCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/main": (context) => HomePage(),
          "/detail": (context) => DetailPage()
        },
        initialRoute: "/",
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text("Unknown Route")),
              body: Center(child: Text("Unknown Route")),
            ),
          );
        },
      ),
    );
  }
}
