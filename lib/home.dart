import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_v2/charts/chart.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _saldo = 15.75;
  var DateTime_ultimaAtualizacao = DateTime.now();
  bool _mostrarSaldo = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
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
            Navigator.pushReplacementNamed(context, '/');
          },
          icon: Transform.rotate(
            angle: math.pi,
            child: const Icon(Icons.logout, color: Colors.white),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 10, 15, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              color: const Color(0xFF1f7735),
              elevation: 12,
              shape: cardShape,
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Saldo Total',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  setState(() {
                                    _mostrarSaldo = !_mostrarSaldo;
                                  });
                                },
                                icon: Icon(
                                  _mostrarSaldo
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  setState(() {
                                    DateTime_ultimaAtualizacao = DateTime.now();
                                  });
                                },
                                icon: const Icon(
                                  Icons.autorenew_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _mostrarSaldo
                              ? currencyFormat.format(_saldo)
                              : '*******',
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
            Row(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Suas Contas',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                SizedBox(width: 180),
                Card(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 5, 105, 26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 35,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  AccountCard(
                    icon: Icons.account_balance,
                    title: "Conta Corrente",
                    subtitle: "Conta Corrente",
                    valorConta: 32.45,
                  ),
                  AccountCard(
                    icon: Icons.savings_rounded,
                    title: "Poupança",
                    subtitle: "Poupança",
                    valorConta: 2.50,
                  ),
                  AccountCard(
                    icon: Icons.trending_up_sharp,
                    title: "Investimentos",
                    subtitle: "Investimentos",
                    valorConta: 0.70,
                  ),
                  AccountCard(
                    icon: Icons.credit_card_rounded,
                    title: "Cartão de Crédito",
                    subtitle: "Cartão de Crédito",
                    valorConta: -15.00,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            Card(
              margin: const EdgeInsets.fromLTRB(15, 10, 0, 5),
              color: Colors.white,
              elevation: 12,
              shape: cardShape,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gastos por Categoria',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 200, child: DonutChart()),
                  ],
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              color: Colors.white,
              elevation: 12,
              shape: cardShape,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(90, 60, 130, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              shape: cardShape,
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
  final String subtitle;
  final IconData icon;
  final double valorConta;

  const AccountCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.valorConta,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 255, 255, 255),
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 180,
        height: 145,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 25, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    currencyFormat.format(valorConta),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: valorConta >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
