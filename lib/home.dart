import 'package:flutter/material.dart';

// Define um classe MyApp que herda funcionalidade da classe StatelessWidget, ou seja sem estado mutavel
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 190, 233),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
              margin: const EdgeInsets.fromLTRB(100, 500, 100, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color.fromARGB(255, 217, 36, 36),
                ),
                child: const Text(
                  'Back to Log In',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
