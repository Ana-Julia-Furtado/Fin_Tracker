import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DonutChart extends StatelessWidget {
  const DonutChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 180,
              child: PieChart(
                PieChartData(
                  sections: showingSections(),
                  centerSpaceRadius: 50,
                  sectionsSpace: 0,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Indicator(
                  color: Color(0xFFE55C55),
                  text: 'Alimentação',
                  value: 'R\$ 300,50',
                ),
                Indicator(
                  color: Color(0xFF4594DB),
                  text: 'Transporte',
                  value: 'R\$ 80,75',
                ),
                Indicator(
                  color: Color(0xFFF3C044),
                  text: 'Saúde',
                  value: 'R\$ 2,25',
                ),
                Indicator(
                  color: Color(0xFFE58739),
                  text: 'Entretenimento',
                  value: 'R\$ 100.45',
                ),
                Indicator(
                  color: Color(0xFFCE4D51),
                  text: 'Compras',
                  value: 'R\$ 65,50',
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
        color: const Color(0xFFE55C55),
        value: 850.50,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFF4594DB),
        value: 420.30,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFFF3C044),
        value: 320.75,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFFE58739),
        value: 280.90,
        title: '',
        radius: 35,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: const Color(0xFFCE4D51),
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
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
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
