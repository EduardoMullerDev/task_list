import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 

class TelaFeedback extends StatelessWidget {
  final TextEditingController _feedbackController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Envie seu feedback:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: themeProvider.isDarkMode ? Colors.orange : Colors.black, 
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _feedbackController, 
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Digite seu feedback aqui...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Obrigado!'),
                      content: Text('Obrigado pelo feedback, estamos sempre abertos a receber sua opinião.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );

                
                _feedbackController.clear(); 
              },
              child: Text('Enviar Feedback'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
