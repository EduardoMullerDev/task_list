import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; 
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 

class TelaCalendario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário'),
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
               
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                onDaySelected: (selectedDay, focusedDay) {
                 
                  print('Dia selecionado: $selectedDay');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
