import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 

class TelaTemas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Temas'),
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Escolha o tema:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tema Claro',
                  style: TextStyle(fontSize: 16.0),
                ),
                Switch(
                  value: !themeProvider.isDarkMode,
                  onChanged: (_) {
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tema Escuro',
                  style: TextStyle(fontSize: 16.0),
                ),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (_) {
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
