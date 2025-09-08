import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DonutChart extends StatelessWidget {
  const DonutChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // MUDANÇA: Usar uma Row para colocar o gráfico e a legenda lado a lado.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: PieChart(
                PieChartData(
                  sections: showingSections(),
                  centerSpaceRadius: 60,
                  sectionsSpace: 0,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            const SizedBox(width: 32),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Indicator(
                  color: Color(0xFFE55C55), // Vermelho
                  text: 'Alimentação',
                  value: 'R\$ 850,50',
                ),
                Indicator(
                  color: Color(0xFF4594DB), // Azul
                  text: 'Transporte',
                  value: 'R\$ 420,30',
                ),
                Indicator(
                  color: Color(0xFFF3C044), // Amarelo
                  text: 'Saúde',
                  value: 'R\$ 320,75',
                ),
                Indicator(
                  color: Color(0xFFE58739), // Laranja
                  text: 'Entretenimento',
                  value: 'R\$ 280,90',
                ),
                Indicator(
                  color: Color(0xFFCE4D51), // Vermelho mais escuro
                  text: 'Compras',
                  value: 'R\$ 650,25',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: const Color(0xFFE55C55), // Vermelho
        value: 850.50,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFF4594DB), // Azul
        value: 420.30,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFFF3C044), // Amarelo
        value: 320.75,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFFE58739), // Laranja
        value: 280.90,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFFCE4D51), // Vermelho mais escuro
        value: 650.25,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
    ];
  }
}

// Widget auxiliar para as legendas
class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final String value;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
