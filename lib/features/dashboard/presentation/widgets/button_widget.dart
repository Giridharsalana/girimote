
import 'package:flutter/material.dart';
import 'package:girimote/features/dashboard/data/models/widget_model.dart';
import 'package:girimote/features/dashboard/presentation/view_models/dashboard_view_model.dart';

class ButtonWidget extends StatelessWidget {
  final DashboardWidgetModel widget;
  final DashboardViewModel viewModel;

  const ButtonWidget({super.key, required this.widget, required this.viewModel}) ;

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
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Press Me'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
