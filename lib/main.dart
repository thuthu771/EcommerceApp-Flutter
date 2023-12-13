import 'package:flutter/material.dart';
import 'package:online_ui/api/shoppingapi.dart';
import 'package:online_ui/cartprovider.dart';
import 'package:online_ui/navbar.dart';
//import 'package:online_ui/shopping.dart';
//import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Shoppingimg>(create: (_) => Shoppingimg()),
        ChangeNotifierProvider<cart>(create: (_) => cart())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PersistentNavBarExample());
  }
}
