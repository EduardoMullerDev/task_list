import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'telainicial.dart';
import 'theme_provider.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), 
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'To Do List App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
        ),
        brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light, 
      ),
      home: TelaInicial(), 
    );
  }
}
