import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_v2/charts/chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _saldo = 15.75;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 220, 248, 215),
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
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      drawer: SizedBox(
        width: 150,
        child: Drawer(
          backgroundColor: Colors.green,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  'Sair',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              color: const Color(0xFF1f7735),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Saldo Total',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          currencyFormat.format(_saldo),
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 2),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Última atualização: ${DateFormat.Hm().format(DateTime.now())}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.75),
                          ),
                        ),
                      ),
                      const Spacer(),
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
              color: Colors.white,
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gastos por Categoria',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 200, child: DonutChart()),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              color: Colors.white,
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(150, 40, 150, 40),
                child: Column(
                  children: const [
                    Text(
                      'Ações Rápidas',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              color: Colors.white,
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(120, 40, 120, 40),
                child: Column(
                  children: const [
                    Text(
                      'Transações Recentes',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _saldo += 4.50;
          });
        },
        backgroundColor: const Color.fromARGB(255, 18, 88, 21),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add, size: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
            color: Colors.white,
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
