import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CowDetailPage extends StatelessWidget {
  final Map<String, dynamic> cow;
  final double x;
  final double y;
  final double z;

  CowDetailPage({
    required this.cow,
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cow['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              cow['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              cow['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              cow['details'],
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              'Accelerometer:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: [
                      PieChartSectionData(
                        color: Colors.red,
                        value: x.abs(),
                        title: 'X',
                        radius: 50,
                        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: Colors.green,
                        value: y.abs(),
                        title: 'Y',
                        radius: 50,
                        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: Colors.blue,
                        value: z.abs(),
                        title: 'Z',
                        radius: 50,
                        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Sumbu X: $x'),
            Text('Sumbu Y: $y'),
            Text('Sumbu Z: $z'),
          ],
        ),
      ),
    );
  }
}
