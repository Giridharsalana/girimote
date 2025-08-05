
import 'package:flutter/material.dart';
import 'package:girimote/features/dashboard/data/models/widget_model.dart';
import 'package:girimote/features/dashboard/presentation/view_models/dashboard_view_model.dart';

class SwitchWidget extends StatefulWidget {
  final DashboardWidgetModel widget;
  final DashboardViewModel viewModel;

  const SwitchWidget({super.key, required this.widget, required this.viewModel}) ;

  @override
  State<SwitchWidget> createState() => SwitchWidgetState();
}

class SwitchWidgetState extends State<SwitchWidget> {
  bool _value = false;

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
              title: Text(widget.widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: widget.viewModel.isEditMode
                  ? IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        widget.viewModel.deleteWidget(widget.widget.id);
                      },
                    )
                  : null,
            ),
            Expanded(
              child: Center(
                child: Switch.adaptive(
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
