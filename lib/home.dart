import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _saldo = 0.00;

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 119, 53),
        elevation: 10,
        centerTitle: true,
        title: const Text(
          'Finance Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            wordSpacing: 5,
            fontFamily: 'Libertinus Serif Display',
            letterSpacing: 2,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 150),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // CARD DO SALDO
              Card(
                color: const Color.fromARGB(255, 59, 87, 59),
                elevation: 12,
                margin: const EdgeInsets.only(bottom: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const ListTile(
                        title: Text(
                          'Saldo Total',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          currencyFormat.format(_saldo),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // CARD "SUAS CONTAS" + BOTOES
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Suas Contas',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Card(
                            margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                50,
                                50,
                                50,
                                50,
                              ),
                              child: const Text(
                                'Conta Corrente',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  letterSpacing: 0.5,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(255, 117, 116, 116),
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                50,
                                50,
                                50,
                                50,
                              ),
                              child: const Text(
                                'Poupança',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  letterSpacing: 0.5,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(255, 117, 116, 116),
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: const Color.fromARGB(
                            255,
                            125,
                            250,
                            146,
                          ),
                        ),
                        child: const Text(
                          'Back to Log In',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            letterSpacing: 0.5,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Color.fromARGB(255, 117, 116, 116),
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _saldo += 4.50;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: const Color.fromARGB(
                            255,
                            125,
                            250,
                            146,
                          ),
                        ),
                        child: const Text(
                          'Soma',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            letterSpacing: 0.5,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Color.fromARGB(255, 117, 116, 116),
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
