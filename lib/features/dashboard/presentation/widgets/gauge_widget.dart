
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:girimote/features/dashboard/data/models/widget_model.dart';
import 'package:girimote/features/dashboard/presentation/view_models/dashboard_view_model.dart';

class GaugeWidget extends StatelessWidget {
  final DashboardWidgetModel widget;
  final DashboardViewModel viewModel;

  const GaugeWidget({super.key, required this.widget, required this.viewModel}) ;

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
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    pointers: const <GaugePointer>[
                      NeedlePointer(value: 50, enableAnimation: true),
                    ],
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 33, color: Colors.green, startWidth: 10, endWidth: 10),
                      GaugeRange(startValue: 33, endValue: 66, color: Colors.orange, startWidth: 10, endWidth: 10),
                      GaugeRange(startValue: 66, endValue: 100, color: Colors.red, startWidth: 10, endWidth: 10),
                    ],
                    axisLabelStyle: GaugeTextStyle(fontSize: 10, color: Colors.grey[700]),
                    majorTickStyle: const MajorTickStyle(length: 0.1, thickness: 2, color: Colors.grey),
                    minorTickStyle: const MinorTickStyle(length: 0.05, thickness: 1, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
