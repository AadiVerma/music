import 'package:flutter/material.dart';
import 'package:music/models/playlist.dart';
import 'package:music/pages/homepage.dart';
import 'package:music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvide()),
        ChangeNotifierProvider(create: (context) => playList()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(), // Set the initial screen here
      theme: Provider.of<ThemeProvide>(context).themedata,
    );
  }
}
