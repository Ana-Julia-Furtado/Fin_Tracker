import 'package:flutter/material.dart';
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
      backgroundColor: const Color.fromARGB(255, 129, 248, 106),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f7735),
        elevation: 10,
        centerTitle: true,
        title: const Text(
          'Finance Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: 2,
            shadows: [
              Shadow(blurRadius: 10, color: Colors.black, offset: Offset(5, 5)),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card do Saldo
            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                height: 180,
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 150, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saldo',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currencyFormat.format(_saldo),
                        style: TextStyle(
                          fontSize: 30,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Suas Contas
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Suas Contas',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: const [
                Expanded(
                  child: AccountCard(
                    title: 'Conta Corrente',
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  ),
                ),
                Expanded(
                  child: AccountCard(
                    title: 'Poupança',
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  ),
                ),
              ],
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(120, 40, 120, 40),
                child: Column(
                  children: [
                    Text(
                      'Gastos por Categoria',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 3, 0, 0),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(150, 40, 150, 40),
                child: Column(
                  children: [
                    Text(
                      'Ações Rápidas',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(120, 40, 120, 40),
                child: Column(
                  children: [
                    Text(
                      'Transações Recentes',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            // Botões
            ActionButton(
              margin: const EdgeInsets.fromLTRB(100, 0, 100, 10),
              text: 'Back to Log In',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            const SizedBox(height: 10),
            ActionButton(
              margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              text: 'Soma',
              onPressed: () {
                setState(() {
                  _saldo += 4.50;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String title;
  final EdgeInsets? margin;
  final double? elevation;
  final ShapeBorder? shape;
  const AccountCard({
    super.key,
    required this.title,
    this.margin,
    this.elevation,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        elevation: elevation ?? 12,
        shape:
            shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color.fromARGB(255, 60, 123, 182),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 233, 233, 233),
                fontWeight: FontWeight.bold,
                fontSize: 13,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Color.fromARGB(255, 53, 46, 46),
                    offset: Offset(5, 5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets? margin;
  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: const Color.fromARGB(255, 2, 70, 13),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 13,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Color(0xFF757474),
                offset: Offset(5, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
