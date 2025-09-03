import 'package:flutter/material.dart';
import 'package:login_v2/home.dart';

// Define um classe MyApp que herda funcionalidade da classe StatelessWidget, ou seja sem estado mutavel
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 236, 204),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // alinha os filhos da coluna horizontalmente no centro
          mainAxisAlignment: MainAxisAlignment
              .center, // alinha os filhos da coluna verticalmente no centro
          children: <Widget>[
            // As chaves angulares (<Widget>) indicam que se trata de uma lista de widgets
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
              child: const Icon(
                Icons.wallet_rounded, // Definição do ícone
                size: 120,
                color: Color.fromARGB(255, 36, 95, 38),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(90.0)),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(90.0)),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color.fromARGB(255, 42, 189, 164),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color.fromARGB(255, 42, 189, 164),
                ),
                child: const Text(
                  'Registro',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onPressed: () {},
              ),
            ),

            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Color.fromARGB(255, 16, 44, 17)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
