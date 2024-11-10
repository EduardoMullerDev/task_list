import 'package:flutter/material.dart';
import 'teladelogin.dart';
class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(
              Icons.checklist, 
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Task List',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'APP',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 400),
            ElevatedButton(
              onPressed: () {
              
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaDeLogin()), 
                );
              },
              child: Text('INICIAR'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue, backgroundColor: Colors.white, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), 
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

