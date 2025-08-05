
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:girimote/features/dashboard/data/models/widget_model.dart';
import 'package:girimote/features/dashboard/presentation/view_models/dashboard_view_model.dart';

class PlotWidget extends StatelessWidget {
  final DashboardWidgetModel widget;
  final DashboardViewModel viewModel;

  const PlotWidget({super.key, required this.widget, required this.viewModel}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: viewModel.isEditMode
                  ? IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        viewModel.deleteWidget(widget.id);
                      },
                    )
                  : null,
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4.9, 5),
                        FlSpot(6.8, 2.5),
                        FlSpot(8, 4),
                        FlSpot(9.5, 3),
                        FlSpot(11, 4),
                      ],
                      isCurved: true,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                        show: false,
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString(), style: const TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString(), style: const TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                                    borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
